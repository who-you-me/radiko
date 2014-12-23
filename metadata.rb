name             'radiko'
maintainer       'Hisao Soyama'
maintainer_email 'hisao.soyama<AT>gmail.com'
license          'Apache License 2.0'
description      'Installs/Configures rec_radiko'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'system'
depends 'ntp'
depends 'yum-epel'
depends 'yum-repoforge'
depends 'apt'
