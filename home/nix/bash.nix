{...}: {
  # Sets up bash, bc .bashrc isn't in .config so my sources thing won't work with it.
  programs.bash = {
    enable = true;
    initExtra = ''
      PS1='[\u@\H \W]$ '
      set -o vi

      # Very useful for my note-taking style.
      # I don't care to carefuly groom and curate notes like you do in obsidian.
      # I just retain absolutely everything no matter how insignificant.
      # Then I can dredge things back up with grep should something prove relevant later.
      # Sk for notes to just throw in the pile, skd for ones to keep on hand for a bit first.
      # Skdn opens tomorrow's skd note, which is good for planning.
      alias sk='python ~/.rice/assets/sk.py'
      alias skd='python ~/.rice/assets/skd.py'
      alias skdn='python ~/.rice/assets/skdn.py'

      alias vi='nvim'
      alias ls='ls --color=auto'
      alias sl='ls'
      alias la='ls -A'
      alias ll='ls -lh'
      alias l='ls -Alh'
      alias cl='clear'
    '';
  };
}
