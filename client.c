/*
 * Protocoale de comunicatii
 * Laborator 7 - TCP
 * Echo Server
 * client.c
 */

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h>

#define BUFLEN 1500

int main(int argc, char *argv[])
{
    int sockfd = 0;
    char buf[BUFLEN] = "Destroy and conquer";
    struct sockaddr_in serv_addr; 

    if(argc != 3)
    {
        printf("\n Usage: %s <ip> <port>\n", argv[0]);
        return 1;
    }

	

	

    // deschidere socket
	int client = socket(PF_INET, SOCK_STREAM, 0);
    // completare informatii despre adresa serverului

	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(3000);
	inet_aton(argv[1], &(serv_addr.sin_addr));

	 // conectare la server

	

	
    // citire de la tastatura, trimitere de cereri catre server, asteptare raspuns
	int ct = connect(client, (struct sockaddr *)& serv_addr, sizeof(serv_addr));

	while(1){

	scanf("%s", buf);
	write(client, buf, BUFLEN);
	read(client, buf, BUFLEN);
	printf("Buf primit [CLIENT] : %s\n", buf);
	}
	
	





    // inchidere socket
	close(client);

    return 0;
}
