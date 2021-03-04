
//Creating a model class for comment json file
class Comment
{
  //Creating properties of comment class
  int postId;
  int id;
  String name;
  String email;
  String body;

  //Creating a default constructor for Comment Class
  Comment({this.postId,this.id,this.name,this.email,this.body});

  //Parsing json data to object
  factory Comment.fromJson(Map<String,dynamic> parsedjson)
  {
    return Comment(
      postId: parsedjson['postId'],
      id: parsedjson['id'],
      name: parsedjson['name'],
      email: parsedjson['email'],
      body: parsedjson['body']
    );
  }
}


class CommentList
{
  //Creating a list of comment type to save multiple comments
  final List<Comment> comments;
//Default constructor of comment list class
  CommentList(this.comments);

  //Convert the complete file of json into list
  factory CommentList.fromJson(List<dynamic> parsedjson)
  {
    //Creating a local variable of list<Comment>
    List<Comment> allcomment = <Comment>[];
    allcomment = parsedjson.map((i) => Comment.fromJson(i)).toList();
    return new CommentList(allcomment);
  }

}