/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;
import model.Comment;
import model.PublicDiscussion;
import org.bson.types.ObjectId;
import service.PublicPostConverter;
import util.sequence.model.SequenceId;

/**
 *
 * @author BHAVESH GOYAL
 */
public class PublicPostDAO {
        private DBCollection col;

    public PublicPostDAO(MongoClient mongo) {
        this.col = mongo.getDB("vidico").getCollection("public");
    }

    public PublicDiscussion newPost(PublicDiscussion pb) {
        DBObject doc = PublicPostConverter.toDBObject(pb);
        this.col.insert(doc);
        pb.setid((ObjectId) doc.get("_id"));
        return pb;
    }
    
    public ArrayList<PublicDiscussion> showPost()
    { 
        ArrayList<PublicDiscussion> arpb=new ArrayList<PublicDiscussion>();
             
        try{
        BasicDBObject whereQuery = new BasicDBObject();
        DBObject oneDetails;
   // whereQuery.put("userId", "101");
    DBCursor cursor = this.col.find();
    while(cursor.hasNext()) {
        oneDetails=cursor.next();
        PublicDiscussion pb;
     pb=PublicPostConverter.toPublicDiscussion(oneDetails);
       
        arpb.add(pb);
  //      System.out.println(pb.getUsertId());
//        System.out.println(pb.getTopic());
//        System.out.println(pb.getContent());
//        System.out.println(pb.getTagsString());
    }
    
        }catch (Exception e) {
            System.out.println(e.getMessage()+"dao");
        }
        
    return arpb;    }
    
     public PublicDiscussion showDetailPost(String postid)
    { 
         
             PublicDiscussion pb=null;
        try
        {
        BasicDBObject whereQuery = new BasicDBObject();
        DBObject oneDetails;
  whereQuery.put("_id", new ObjectId(postid));
    DBCursor cursor = this.col.find(whereQuery);
    
        oneDetails=cursor.next();
        
     pb=PublicPostConverter.toPublicDiscussion(oneDetails);
       
      //      System.out.println(pb.getUsertId());
//        System.out.println(pb.getTopic());
//        System.out.println(pb.getContent());
//        System.out.println(pb.getTagsString());
    
    
        }catch (Exception e) {
            System.out.println(e.getMessage()+"dao");
        }
        
    return pb;    }
//     public  void updatePost(ArrayList<PublicDiscussion> arpb)
//    { 
//             
//        try{
//            
//        
//    DBCursor cursor = this.col.find();
//    while(cursor.hasNext()) {
//             PublicDiscussion pb=arpb.get(index);
//             DBObject doc = PublicPostConverter.toDBObject(pb);
//            BasicDBObject whereQuery = new BasicDBObject();
//    whereQuery.put("userId",pb.getUsertId());
//   
//     this.col.update(whereQuery, doc);
//        
//        
//    
//    }
//    
//        }catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        
//      }
//     
//     public void addcomment(String id,Comments newComment)
//     {
//         
     
//     }

}
