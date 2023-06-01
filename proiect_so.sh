#!/bin/bash

# Plaiasu Robert Constantin si Popescu Ruxandra Nicoleta - grupa 1008

# afisare meniu
meniu()
{
    local number=0
    echo "Scrie numarul scriptului pe care doresti sa-l executi:"
    echo "1)Selectati numele fisierului din care doriti sa inlocuiti un sir de caractere citit cu alt sir de caractere citit.(se va inlocui doar prima aparitie de pe fiecare linie)"
    echo "2)Creaza un script in folderul curent cu un nume ales de tine care sa afiseze \"It Works!\" si care ruleaza imediat."
    echo "3)Adauga un utilizator."
    echo "4)Sterge un utilizator."
    read number
    return $number
}

# scriptul 1
script_1()
{
    # citesc numele fisierului
    echo "Numele fisierului:"
    read file
    if [ -f $file ]; then
        # citesc sirul de caractere ce vreau sa-l inlocuiesc
        echo  "Sirul de caractere pe care vreau sa-l inlocuiesc:"
        read char_1
        echo  "Sirul de caractere pe care vreau sa-l pun:"
        read char_2
        sed 's/'$char_1'/'$char_2'/' $file

    else
        # daca fisierul nu exista atunci afisez mesaj
        echo "Fisierul nu exista."
    fi
}

# creaza fisierul ce contine "It works" si il ruleaza
create_it_works()
{
    # continutul fisierului ce afiseaza "It Works!"
    content="#!/bin/bash\n\necho \"It Works!\"\n"
    # introducerea contentului in fisier
    echo -e "$content" > "$1"
    # acordare permisiuni de executare a fisierului
    chmod +x "$1"

    #rulare a noului script
    ./"$1"
}

# scriptul 2
script_2()
{
    # citesc numele fisierului
    echo "Numele fisierului:"
    read file
    if [ -f $file ]; then
        # daca fisierul nu exista atunci afisez mesaj
        echo "Fisierul exista deja. Esti sigur ca doresti sa vrei sa-l modifici ?(Y sau N)"
        read change_file
        # verific daca raspunsul este y sau n
        if [[ $change_file == "Y" || $change_file == "y" ]]; then
            # crearea fisierului cu numele specificat ca parametru
            create_it_works $file
        elif [[ $change_file == "N" || $change_file == "n" ]]; then
            echo "Actiunea a fost intrerupta."
        else
            echo "Raspunsul tau este invalid."
        fi
    else
        # crearea fisierului cu numele specificat ca parametru
        create_it_works $file
    fi
}

script_3()
{
    if [[ $EUID -ne 0 ]]; then
        echo "Acest script trebuie rulat cu privilegii de root."
        return 0;
    fi

    echo "Introduce numele utilizatorului:"
    read username
    # verifica daca utilizatorul exista deja
    if [ `sed -n "/^$username/p" /etc/passwd` ]; then
        echo "Utilizatorul exista deja."
        return 0;
    fi

    echo "Introduce parola temporara a utilizatorului:"
    read -s password

    # creeaza utilizatorul si directorul home
    useradd -m "$username"

    # schimba parola utilizatorului
    echo "$username:$password" | chpasswd

    # solicita utilizatorului sa schimbe parola la prima autentificare
    passwd -e "$username"

    echo "Utilizatorul $username a fost creat cu succes."
}

script_4()
{
    # verifica daca utilizatorul care ruleaza scriptul are drepturi de root
    if [[ $EUID -ne 0 ]]; then
        echo "Acest script trebuie rulat cu privilegii de root."
        return 0
    fi

    
    echo "Introduce numele utilizatorului:"
    read username
    # verifica daca utilizatorul exista deja
    if [[ ! `sed -n "/^$username/p" /etc/passwd` ]]; then
        echo "Utilizatorul $username nu exista."
        return 0
    fi

    # solicita confirmarea utilizatorului pentru stergerea directorului home
    echo "Doriti sa stergeti directorul home al utilizatorului $username? (Y sau N): "
    read delete_home

    if [[ $delete_home == "Y" || $delete_home == "y" ]]; then
        # sterge utilizatorul si directorul home
        userdel -r "$username"
        echo "Utilizatorul $username si directorul home au fost sterse cu succes."
    elif [[ $delete_home == "N" || $delete_home == "n" ]]; then
        # sterge doar utilizatorul
        userdel "$username"
        echo "Utilizatorul $username a fost sters cu succes. Directorul home nu a fost sters."
    else 
        echo "Raspunsul este invalid."
        return 0
    fi
}

# afisare meniu in care alegi scriptul pe care vrei sa-l rulezi
meniu
# numarul scriptului citit de utlizator este verificata daca este valida
script=$?

# utilizarea unui switch pentru pentru determinare ce script sa rulez
case $script in
    1)
        script_1
        ;; 
    2)
        script_2
        ;;
    3)
        script_3
        ;;
    4)
        script_4
        ;;
    *) 
        echo "Numarul este invalid."
        ;;
esac 


