##################
# system aliases #
##################
function ls --description 'alias ls=ls --color=auto'
    command ls --color=auto $argv
end

function ll --description 'alias ll=ls -la'
    ls -la $argv
end

function vi --description 'alias vi=nvim'
    nvim $argv
end

function vim --description 'alias vim=nvim'
    nvim $argv
end

function oldnvim --description 'alias oldnvim=NVIM_APPNAME="oldnvim" nvim'
    NVIM_APPNAME="oldnvim" nvim $argv
end


###################
# secrets aliases #
###################
function keychain-get
    set ACCOUNT $argv[1]
    set SERVICE $argv[2]
    security find-generic-password -a $ACCOUNT -s $SERVICE -w | pbcopy
end

function keychain-update
    set ACCOUNT $argv[1]
    set SERVICE $argv[2]
    security add-generic-password -a $ACCOUNT -s $SERVICE -U -w
end

function get-secondary-id
    keychain-get jslatko1 secondary-id
end

function update-secondary-id
    keychain-update jslatko1 secondary-id
end

function get-jerrysl-git
    keychain-get jerrysl jerrysl-git
end

function update-jerrysl-git
    keychain-update jerrysl jerrysl-git
end

