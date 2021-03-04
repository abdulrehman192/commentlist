import 'package:commentlist/model/Network.dart';
import 'package:commentlist/model/comments.dart';
import 'package:flutter/material.dart';

class Comment_List extends StatefulWidget {
  @override
  _Comment_ListState createState() => _Comment_ListState();
}

class _Comment_ListState extends State<Comment_List> {
  Future<CommentList> data;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = new Network("https://jsonplaceholder.typicode.com/comments");
    data = network.fetchData();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment List View'),
        backgroundColor: Colors.greenAccent.shade400,
      ),
      body: Center(
        child: FutureBuilder(
          future: data,
          builder: (context,AsyncSnapshot<CommentList> snapshot)
          {
            List<Comment> allcomments = <Comment>[];
            if(snapshot.hasData)
              {
                  allcomments = snapshot.data.comments;
                  return CustomCard(context,allcomments);
              }
            else
              {
                return CircularProgressIndicator();
              }
          },
        ),
      ),
    );
  }

  Widget CustomCard(BuildContext context, List<Comment> allcomments)
  {
    return ListView.builder(
        itemCount: allcomments == null ? 0 : allcomments.length,
        itemBuilder: (context,int index)
        {
          return Container
           (
            color: Colors.greenAccent.shade100,
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.greenAccent.shade400,
                  child: Text('$index',style: TextStyle(color: Colors.white),),

                ),
                title: Text('${allcomments[index].email}'),
                subtitle: Text('${allcomments[index].body}'),
              ),
            ),
          );
        }
    );
  }
}
