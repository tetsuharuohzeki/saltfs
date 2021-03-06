/lib/systemd/system/xvfb.service:
  file.managed:
    - source: salt://xvfb/xvfb.service
    - user: root
    - group: root
    - mode: 644

xvfb:
  pkg.installed: []
  {% if grains.get('virtual_subtype', '') != 'Docker' %}
  service.running:
    - enable: True
    - watch:
      - pkg: xvfb
      - file: /lib/systemd/system/xvfb.service
  {% endif %}
