function regValid() {
    var voterId=document.getElementById("voterid");
    var fname = document.getElementById("name");
    var uname = document.getElementById("username");
    var gen = document.getElementById("gender");
    var date = document.getElementById("dob");
    var uemail = document.getElementById("email");
    var pass = document.getElementById("password");
    if (nameCheck(fname)) {
        if (unameCheck(uname)) {
            if (genderCheck(gen)) {
                if (emailCheck(uemail)) {
                    if (voteridCheck(voterId)) {
                        if (passwordCheck(pass, 8, 20)) {
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}

function nameCheck(uname) {
    var letters = /^[A-Za-z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
    if (uname.value.match(letters)) {
        return true;
    } else {
        alert('Name must have alphabet characters only');
        uname.focus();
        return false;
    }
}

function unameCheck(mname) {
    var letters = /^[A-Za-z]+$/;
    if (mname.value.match(letters)) {
        return true;
    } else {
        alert('Username must have alphabet characters only');
        mname.focus();
        return false;
    }
}

function genderCheck(gen) {
    if (gen.value === "Default") {
        alert("Please select gender from list");
        gen.focus();
        return false;
    } else {
        return true;
    }
}

function emailCheck(uemail) {
    //w=[A-Za-z0-9]
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (uemail.value.match(mailformat)) {
        return true;
    } else {
        alert("You have entered an invalid email address!");
        uemail.focus();
        return false;
    }
}

function voteridCheck(election) {
    var letters = /^[A-Za-z0-9]+$/;
    if (election.value.match(letters)) {
        return true;
    } else {
        alert('Election Card No. must have alphanumeric characters only');
        election.focus();
        return false;
    }
}

function passwordCheck(passid, mx, my) {
    var passid_len = passid.value.length;
    if (passid_len === 0 || passid_len >= my || passid_len < mx) {
        alert("Password should not be empty / length be between " + mx + " to " + my);
        passid.focus();
        return false;
    } else {
        return true;
    }

}
