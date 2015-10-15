function check(){
	var c1c=false; 
    for(var i=0;i<document.form1.c1.length;i++){ 
          if(document.form1.c1[i].checked==true)
          c1c=true;
     } 
     if(c1c==false){ 
        window.alert("请评价授课内容"); 
        return false; 
      }
      
      var c2c=false; 
      for(var i=0;i<document.form1.c2.length;i++){ 
            if(document.form1.c2[i].checked==true)
            c2c=true;
       } 
       if(c2c==false){ 
          window.alert("请评价教学方式"); 
          return false; 
        }
       
        var c3c=false; 
        for(var i=0;i<document.form1.c3.length;i++){ 
              if(document.form1.c3[i].checked==true)
              c3c=true;
         } 
         if(c3c==false){ 
            window.alert("请评价教学态度"); 
            return false; 
          }
          
          var c4c=false; 
          for(var i=0;i<document.form1.c4.length;i++){ 
                if(document.form1.c4[i].checked==true)
                c4c=true;
           } 
           if(c4c==false){ 
              window.alert("请评价传授知识和引发学生思考的能力"); 
              return false; 
            }
            
            var c5c=false; 
            for(var i=0;i<document.form1.c5.length;i++){ 
                  if(document.form1.c5[i].checked==true)
                  c5c=true;
             } 
             if(c5c==false){ 
                window.alert("请评价作业、考核方式"); 
                return false; 
              }
             
              var c6c=false; 
              for(var i=0;i<document.form1.c6.length;i++){ 
                    if(document.form1.c6[i].checked==true)
                    c6c=true;
               } 
               if(c6c==false){ 
                  window.alert("请评价对这门课程的总体印象"); 
                  return false; 
                }
                return true;
}