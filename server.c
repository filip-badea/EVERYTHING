/*
 * Protocoale de comunicatii
 * Laborator 7 - TCP
 * Echo Server
 * server.c
 */

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>

#define BUFLEN 1500

int main(int argc, char *argv[])
{
    int listenfd = 0, connfd = 0;
    char buf[BUFLEN];
    struct sockaddr_in serv_addr;
    struct sockaddr_in client1;
    struct sockaddr_in client2; 

    if(argc != 3)
    {
        printf("\n Usage: %s <ip> <port>\n", argv[0]);
        return 1;
    }



	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(3000);
	serv_addr.sin_addr.s_addr = INADDR_ANY;

    // deschidere socket
	int serv = socket(PF_INET, SOCK_STREAM, 0);

	int client1_len = sizeof(client1);
	int client2_len = sizeof(client2);
	int cl1, cl2;
	unsigned int LEN = sizeof(serv_addr);
    // completare informatii despre adresa serverului
	
    // legare proprietati de socket
	int bnum = bind(serv, (struct sockaddr*) &serv_addr, sizeof(serv_addr));
	printf("Bind number %d \n: ", bnum);
    // ascultare de conexiuni
	listen(serv, 10);
	

    // acceptarea unei conexiuni, primirea datelor, trimiterea raspunsului
	cl1 = accept(serv, (struct sockaddr *)&client1, &client1_len);
	if(cl1 < 0)
		printf("Eroare accept1");	
	cl2 = accept(serv, (struct sockaddr *)&client2, &client2_len);
	if(cl2 < 0)
		printf("Eroare accept2");

	while(1){
	int recv_bytes1 = recv(cl1, buf, BUFLEN, 0);
	
	printf("Receivedd buf cl1: %s \n", buf);
	int send_bytes1 = send(cl2, buf, BUFLEN, 0);
	

	int recv_bytes2 = recv(cl2, buf, BUFLEN, 0);
	
	printf("Receivedd buf cl2: %s \n", buf);
	int send_bytes2 = send(cl1, buf, BUFLEN, 0);
	
	
	}
	
	
	
	
    // inchidere socket(i)
	close(cl1);
	close(cl2);

	close(serv);

    return 0;
}
