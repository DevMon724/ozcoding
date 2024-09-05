const form = document.getElementById("form")

form.addEventListener("submit", function(event) {
    console.log("제출")

    event.preventDefault() //기존 기능 차단

    let userId = event.target.userId.value
    let userPwd = event.target.userPwd.value
    let checkPwd = event.target.checkPwd.value
    let userName = event.target.userName.value
    let userBirth = event.target.userBirth.value
    let userGender = event.target.userGender.value
    let userEmail = event.target.userEmail.value
  
    console.log(userBirth);

    if(userId.length < 8){
        alert("아이디가 너무 짧습니다. 8자 이상 입력해주세요.")
        return
    }

    var num = userPwd.search(/[0-9]/g);
    var eng = userPwd.search(/[a-z]/ig);
    var spe = userPwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
   
    if(userPwd.length < 8 || userPwd.length > 12){
   
     alert("8자리 ~ 12자리 이내로 입력해주세요.");
     document.getElementById("userPwd").focus()
     return false;
    }else if(userPwd.search(/\s/) != -1){
     document.getElementById("userPwd").focus()
     alert("비밀번호는 공백 없이 입력해주세요.");
     return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
     document.getElementById("userPwd").focus()
     alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
     return false;
    }else if(userPwd !== checkPwd){
     document.getElementById("checkPwd").focus()
     alert("동일한 비밀번호를 입력해주세요.")  
     return false; 
    }
    else {
        
        alert("회원가입을 축하드립니다. 홈 화면으로 이동합니다.");

        window.location.href = "mini-project1.html";    
       return true;
       
    }
})


