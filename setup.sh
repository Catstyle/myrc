SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "myrc in path $SCRIPTPATH";

setup_zsh() {
    echo "found zsh, setup myrc into $HOME/.zshrc"
    mv $HOME/.zshrc $HOME/.zshrc.before-myrc
    echo "source $SCRIPTPATH/.prerc" > /tmp/.zshrc.template
    cat $SCRIPTPATH/.zshrc >> /tmp/.zshrc.template
    echo "source $SCRIPTPATH/.myrc" >> /tmp/.zshrc.template
    mv /tmp/.zshrc.template $HOME/.zshrc
}

case "$SHELL" in 
    */zsh)
        setup_zsh
        ;;
    *) echo "currently support zsh only" ;;
esac
