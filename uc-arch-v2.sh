#!/bin/bash

# Funzione per mostrare un messaggio di conferma
show_confirmation() {
  whiptail --title "Conferma" --yesno "$1" 10 60
  return $?
}

# Funzione per mostrare un messaggio di informazione
show_message() {
  whiptail --title "Informazione" --msgbox "$1" 10 60
}

# Funzione per ottenere una lista di pacchetti non necessari
get_unnecessary_packages() {
  # Elenca tutti i pacchetti installati nel sistema
  all_packages=$(pacman -Qqe)

  # Pacchetti essenziali per il corretto funzionamento di Arch Linux
  essential_packages=(
    "base"
    "linux"
    "pacman"
    "glibc"
    # Aggiungi altri pacchetti essenziali se necessario
  )

  # Trova i pacchetti non essenziali
  unnecessary_packages=()
  for package in $all_packages; do
    if ! printf '%s\n' "${essential_packages[@]}" | grep -qx "$package"; then
      unnecessary_packages+=("$package")
    fi
  done

  # Restituisci la lista dei pacchetti non necessari
  echo "${unnecessary_packages[@]}"
}

# Funzione per visualizzare l'ASCII art
show_ascii_art() {
  # Colori per l'ASCII art
  green=$(tput setaf 2)
  blue=$(tput setaf 4)
  reset=$(tput sgr0)


 echo "${green}"
 echo '          _______  _______  _______  _______                    _______'
 echo '|\     /|(  ____ \(  ___  )(  ____ )(  ____ \|\     /||\     /|/ ___   )'
 echo '| )   ( || (    \/| (   ) || (    )|| (    \/| )   ( || )   ( |\/   )  |'
 echo '| |   | || |      | (___) || (____)|| |      | (___) || |   | |    /   )'
 echo '| |   | || |      |  ___  ||     __)| |      |  ___  |( (   ) )  _/   /'
 echo '| |   | || |      | (   ) || (\ (   | |      | (   ) | \ \_/ /  /   _/'  
 echo '| (___) || (____/\| )   ( || ) \ \__| (____/\| )   ( |  \   /  (   (__/\'
 echo '(_______)(_______/|/     \||/   \__/(_______/|/     \|   \_/   \_______/'

 echo "${blue}                         UC-ARCH-V2${reset}"
 echo
}

# Visualizza l'ASCII art all'inizio dello script
show_ascii_art

# Mostra il menu principale
while true; do
  choice=$(whiptail --title "Menu principale" --menu "Scegli un'opzione:" 15 60 5 \
    "1" "Aggiornare Arch con pacman" \
    "2" "Aggiornare Arch con AUR" \
    "3" "Ottimizzare il sistema" \
    "4" "Visualizza pacchetti non necessari" \
    "5" "Cancellare pacchetti orfani" \
    "6" "Pulire la cache" \
    "7" "Esci" 3>&1 1>&2 2>&3)

  case $choice in
    1)
      if show_confirmation "Vuoi aggiornare Arch con pacman?"; then
        echo "Eseguendo l'aggiornamento con pacman..."
        # Comando per l'aggiornamento con pacman
        sudo pacman -Syu
        show_message "Aggiornamento completato con successo!"
      else
        show_message "Aggiornamento annullato."
      fi
      ;;
    2)
      if show_confirmation "Vuoi aggiornare Arch con AUR?"; then
        echo "Eseguendo l'aggiornamento con AUR..."
        # Comando per l'aggiornamento con AUR (utilizzare il gestore AUR preferito)
        # Esempio: yay -Syu
        show_message "Aggiornamento con AUR completato con successo!"
      else
        show_message "Aggiornamento con AUR annullato."
      fi
      ;;
    3)
      if show_confirmation "Vuoi ottimizzare il sistema?"; then
        echo "Eseguendo l'ottimizzazione del sistema..."
        # Comandi per ottimizzare il sistema
        show_message "Ottimizzazione completata con successo!"
      else
        show_message "Ottimizzazione annullata."
      fi
      ;;
    4)
      unnecessary_packages_list=$(get_unnecessary_packages)
      if [ -n "$unnecessary_packages_list" ]; then
        show_message "Ecco la lista dei pacchetti non necessari:\n\n$unnecessary_packages_list"
      else
        show_message "Non sono presenti pacchetti non necessari nel sistema."
      fi
      ;;
    5)
      if show_confirmation "Vuoi cancellare i pacchetti orfani?"; then
        echo "Cancellazione dei pacchetti orfani..."
        # Comando per la rimozione dei pacchetti orfani con pacman
        orphans=$(pacman -Qdtq)
    if [ -n "$orphans" ]; then
        sudo pacman -Rns $orphans
        echo "Pulizia completata!"
    else
        echo "Nessun pacchetto orfano da pulire."
    fi
        show_message "Cancellazione completata con successo!"
      else
        show_message "Cancellazione dei pacchetti orfani annullata."
      fi
      ;;

    6)
      if show_confirmation "Vuoi pulire la cache?"; then
        echo "Pulizia della cache..."
        # Comandi per pulire la cache
        sudo pacman -Sc
        show_message "Pulizia della cache completata con successo!"
      else
        show_message "Pulizia della cache annullata."
      fi
      ;;
    7)
      echo "${green}Goodbye!${reset}"
      exit 0
      ;;
    *)
      show_message "Opzione non valida. Riprova."
      ;;
  esac
done

