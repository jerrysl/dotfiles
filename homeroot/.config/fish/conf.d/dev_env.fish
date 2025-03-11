# All local dev related functions, variables, shortcuts, etc.
/opt/homebrew/bin/brew shellenv | source

set -gx PATH $PATH /Users/jslatko/myscripts

################
# dev env dirs #
################
set -gx GHEC /Users/jslatko/ghec
set -gx PAPI {$GHEC}/optum-tech-ops-mgmt/PIEPAN-PIEAPI
set -gx PAF {$GHEC}/optum-tech-ops-mgmt/PIEPAN-pie-airflow


###################
# pyenv shortcuts #
###################
function pypa
    source {$PAPI}/.venv/bin/activate.fish
end

function pyaf
    source {$PAF}/.venv/bin/activate.fish
end

function pys
    source /Users/jslatko/scratch/.venv/bin/activate.fish
end

function toggleca
    if test -z $REQUESTS_CA_BUNDLE
        set REQUESTS_CA_BUNDLE /Users/jslatko/dev-certs/standard_trusts.pem
    else
        unset REQUESTS_CA_BUNDLE
    end
end


##################################
# PIEAPI local testing functions #
##################################
function pieapi-certs
    docker exec -it node1 mkdir /etc/secrets
    # docker cp ~/dev-certs/tls.crt node1:/etc/secrets/tls.crt
    # docker cp ~/dev-certs/tls.key node1:/etc/secrets/tls.key
    docker cp ~/dev-certs/cyberark.crt node1:/etc/secrets/cyberark.crt
    docker cp ~/dev-certs/cyberark.key node1:/etc/secrets/cyberark.key
end

function clear-podman-images
    for i in (podman image ls -a | awk '{print $3}' | grep -v 'IMAGE')
        podman image rm $i
    end
end


#############################
# kubectl context shortcuts #
#############################
function pieapi-prod
    kubectl config use-context elrprdusr001-jslatko2@optumcloud.com && kubectl config set-context --current --namespace=piepan
end
function pieapi-dev
    kubectl config use-context elrnonprdusr001-jslatko2@optumcloud.com && kubectl config set-context --current --namespace=piepandev
end
function pie-af
    kubectl config use-context elrprdusr101-jslatko2@optumcloud.com && kubectl config set-context --current --namespace=pie-airflow
end
function pie-af-dev
    kubectl config use-context elrnonprdusr101-jslatko2@optumcloud.com && kubectl config set-context --current --namespace=pie-airflow-dev
end
function pie-jenkins
    kubectl config use-context elrprdusr001_pieteam-hcc-jenkins_pieteam-hcc-jenkins-hcc-naas-admin && kubectl config set-context --current --namespace=pieteam-hcc-jenkins
end


###########
# GCP SDK #
###########
# not sure if I actually need this but there was a fish file in there
source (brew --prefix)/share/google-cloud-sdk/path.fish.inc
