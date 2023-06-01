# Poveste realizare proiect

Pentru realizarea acestui proiect a fost nevoie sa cercetez o perioada destul de indelugata pe google pentru a realiza complet cerintele, de aceea o sa apara o bibliografie la final in care voi pune mai multe link-uri de unde am utilizat materiale.
Proiectul este public pe github: https://github.com/RobertPlaiasu/proiect_so
Initial am realiat meniul in care se afiseaza optiunele din care utilizatorul poate alege.
Dupa am realizat primul script numit script_1 in care citesc numele fisierului si 2 string-uri, primul este cel ce vreau sa-l inlocuiesc, iar al doilea este string-ul care va il va inlocui pe primul. N-am stiut daca atunci cand eu fac schimbarea trebuie sa si salvez modificarea in fisier, in momentul actual afiseaza doar pe ecran modificarea. Daca doresc a schimba si fisierul trebuie doar > $file pentru a redirectiona output-ul comenzii in fisierul initial pentru al mmodifica.
Al doilea script, creaza un fisier ce afiseaza mesajul "It Works",  am creat o functie separata ce are numele ca parametru fisierul si creaza continutul acestuia, iar in script_2 am pastrat validari in cazul in care fisierul exista deja daca vreau sa-l inlocuiesc sau nu.
Al treilea script a fost cel mai dificil de realizat,mi-a luat cel mai mult timp, deoarece a fost nevoie sa aflu cum aflu daca utilizatorul are privilegii de root, cum verific daca un utilizator exista sau nu, cum adaug un utilizator si ii creez automat si directorul home(mi-a luat ceva sa aflu ca nu trebuie sa fac ceva special doar sa folosesc useradd -m), cum oblig utilizatorul sa-si schimbe parola.
Ultimul script a fost simplu, deoarece am avut cunostinte de la exercitiul anterior despre ce validari trebuie sa fac. Singurul element de noutate a fost ce comanda de stergere a utilizatorului.
Nu am avut sarcini care sa necesite logica mult, de aceea nu am avut foarte multe ce sa explic.

# Bibliografie

https://stackoverflow.com/questions/1459682/check-unix-username-and-password-in-a-shellscript
https://stackoverflow.com/questions/26475358/negate-if-condition-in-bash-script
https://stackoverflow.com/questions/3980668/how-to-get-a-password-from-a-shell-script-without-echoing
https://stackoverflow.com/questions/4277665/how-do-i-compare-two-string-variables-in-an-if-statement-in-bash
https://askubuntu.com/questions/76808/how-do-i-use-variables-in-a-sed-command
https://stackoverflow.com/questions/584894/environment-variable-substitution-in-sed
https://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-a-shell-script
https://askubuntu.com/questions/393463/create-the-home-directory-while-creating-a-user
https://stackoverflow.com/questions/14810684/check-whether-a-user-exists#:~:text=user%20infomation%20is%20stored%20in,%22no%20such%20user%22%20message.&text=IT%20is%20stored%20in%20%2Fetc%2Fpasswd%20IF%20nsswitch.