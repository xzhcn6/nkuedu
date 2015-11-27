function check() {
	var c1=$('input:radio[name="c1"]:checked').val();
	if(c1==null){
        alert("请评价授课内容!");
        return false;
    } 
	
	var c2=$('input:radio[name="c2"]:checked').val();
	if(c2==null){
        alert("请评价教学方式!");
        return false;
    } 
	
	var c3=$('input:radio[name="c3"]:checked').val();
	if(c3==null){
        alert("请评价教学态度!");
        return false;
    } 
	
	var c4=$('input:radio[name="c4"]:checked').val();
	if(c4==null){
        alert("请评价传授知识和引发学生思考的能力!");
        return false;
    } 
	
	var c5=$('input:radio[name="c5"]:checked').val();
	if(c5==null){
        alert("请评价作业、考核方式!");
        return false;
    } 
	
	var c6=$('input:radio[name="c6"]:checked').val();
	if(c6==null){
        alert("请评价对这门课程的总体印象!");
        return false;
    } 
	
	return true;
}