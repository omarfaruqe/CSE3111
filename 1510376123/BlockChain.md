#Block Chain Design pattern



Block chain is a design pattern for a peer to peer distributed database that maintains a list of records .It is mainly a linked list, where each node is called as a block .Each block store information of its previous and next block just like linked list .It is an open design pattern but not changeable .

![blockchain](C:\Users\Hori\Desktop\1510376123\blockchain.PNG "Blockchain")

                            Figure: Block chain Design

There are mainly two kinds of records in Block chain database. One is transactions and another is blocks. The block mainly hold the information of valid transactions.

##History
  The first work on a cryptographically secured chain of blocks was described in 1991 by Stuart Haber and W.Scott Stornetta. The first Block chain then conceptualized by Satoshi Nakamoto in 2008
**References: Wikipedia **

##Transactions
    Transactions is nothing just a process of transferring data from a sender to a recipient as a token.

##properties of Block chain Design pattern

   **Unchangeable:** Once transactions are process or added to a block and a block is accepted into the Block chain database. It becomes Unchangeable that it can't be edited or deleted. However, it takes some time to make a block final.

   **Distributed:** Every client connected to a Block chain design will have a full copy of transaction log. If any client goes to offline and return after a moment, he will get the transactions log. That's why it is distributed.

   **Open:** Block chain is an open design method that is open to all. Everyone can access the database or server and can observe the transactions because every client get a copy of transactions log. But it can be protected. There are different way to make accessible by others. Some have only access to read or some have read and write or some have only write.

 Some types of Block chain are:

    Public: Everyone have access to write or read
    Public Consortium: Only members have access to write or read but general have only access to read
    Private Consortium: Only members have access to both write and read


##Application

  As Block chain design pattern is an open system. It is mainly used in a system like partnership business to make the system more transparent and trustful among the partner of members of the system. Because Block chain is open system, every member of the system have regular update of the system.

##Advantage

  As Block chain is open system, Researcher can share the data among themselves using this system.


##Disadvantage
  As Block chain is open system, A bad actor can easily access the system and may hamper the system if it is public to all. The main disadvantage is data can't be changed if once proceed.


The Block chain design pattern is not commonly used. As it is unchangeable. But where data needs not to change Block chain design pattern can be used.
