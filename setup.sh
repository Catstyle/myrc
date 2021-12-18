SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "myrc in path $SCRIPTPATH";

setup_zsh() {
    echo "found zsh, setup myrc into $HOME/.zshrc"
    mv $HOME/.zshrc $HOME/.zshrc.before-myrc
    cp $SCRIPTPATH/.zshrc $HOME/.zshrc
    echo "source $SCRIPTPATH/.myrc" >> $HOME/.zshrc
}

case "$SHELL" in 
    */zsh)
        setup_zsh
        ;;
    *) echo "currently support zsh only" ;;
esac
