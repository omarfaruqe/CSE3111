#include <string>
#include <iostream>
#include <sstream>
#include <bits/stdc++.h>
using namespace std;

//Forward declaration of object
class FileInfo;
//An interface for serializer
//this way we can have multiple serializer
class Serializer
{
public:
    string tostring(int s){
        stringstream ss;
        string ret;
        ss << s;
        ss >> ret;
        return ret;
    }
    virtual string serialize(FileInfo *fi) = 0;
};
//A structure to hold file information
class FileInfo
{
public:
    string name, parent_directory;
    int size;
    FileInfo(string n, string p, int s){
        name = n;
        parent_directory = p;
        size = s;
    }
    void serialize(Serializer *sz){
        cout << sz->serialize(this) << endl;
    }
};

//Now, pretend we do not yet decided how to serialize our data
//Then, how we can proceed so that the code does not break?
//Yes, There must some default implementation of this class
//This is called Null object design pattern

//We code a default behavior of Serialize, most of the time it
//will be no operation. But as long long as the 'default behavior semantic
//holds, any implementation is fine.

class NullSerializer: public Serializer
{
public:
    string serialize(FileInfo *fi){
        string res = "";
        res += fi->name + "@";
        res += fi->parent_directory+"$";
        res += tostring(fi->size);

        return res;
    }
};

//Of course, There will be not null serializer
class JSONSerializer: public Serializer
{
public:
    string serialize(FileInfo *fi){
        string res = "";
        res += "{ name: \""+fi->name+"\", ";
        res += "parent: \""+fi->parent_directory+"\", ";
        res += "size: "+tostring(fi->size)+" }";

        return res;
    }
};

int main()
{
    FileInfo file("500 Miles.mp3", "English Songs", 5000);
    file.serialize(new NullSerializer());
    file.serialize(new JSONSerializer());

    return 0;
}
