class people::gongo {
  include emacs
  include packer
  include phantomjs::1_9_0

  git::config::global {
    'user.name':  value  => 'Wataru MIYAGUNI';
    'user.email': value  => 'gonngo@gmail.com';

    'alias.st':   value  => 'status -sb';
    'alias.co':   value  => 'checkout';
    'alias.ci':   value  => 'commit';

    'push.default':  value  => 'tracking';
    'pull.rebase':   value  => true;

    'color.status':  value  => 'auto';
    'color.ui':      value  => 'auto';
    'color.diff':    value  => 'auto';
    'color.branch':  value  => 'auto';
  }

  $packages = [
    'bazaar',
    'curl',
    'curl-ca-bundle',
    'ffmpeg',
    'figlet',
    'gifsicle',
    'global',
    'gnu-sed',
    'gnupg',
    'graphviz',
    'jq',
    'libyaml',
    'mercurial',
    'mplayer',
    'nkf',
    'readline',
    'ssh-copy-id',
    'the_silver_searcher',
    'tmux',
    'tree',
    'wget',
    'youtube-dl',
    'zsh',
    'zsh-completions'
  ]

  package { $packages:
    ensure => latest
  }

  # override puppet-emacs
  Package <| title == 'boxen/brews/emacs' |> {
    install_options => [
      '--cocoa',
      '--srgb',
      '--japanese'
    ]
  }

  $dotfiles = '/opt/dotfiles'

  repository { $dotfiles:
    source  => 'gongo/dotfiles',
    user    => 'root'
  }

  exec { "sh ${dotfiles}/setup.sh":
    require => Repository[$dotfiles]
  }
}
