from flask import Flask, render_template, session, request, redirect, flash
import re
# from datetime import datetime
app = Flask(__name__)
app.secret_key = "registrationformsecretkey"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/success')
def success():
    return render_template('success.html')

@app.route('/submit', methods=['POST'])
def submit():
    errors = False
    length_error = False

    # name validation
    if len(request.form['first_name']) < 1:
        flash("*", "fname")
        length_error = True
        errors = True
    if re.search("[0-9]", request.form['first_name']):
        flash("*", "fname")
        flash("First name cannot contain numbers.", "messages")
        errors = True
    if len(request.form['last_name']) < 1:
        flash("*", "lname")
        length_error = True
        errors = True
    if re.search("[0-9]", request.form['last_name']):
        flash("*", "lname")
        flash("Last name cannot contain numbers.", "messages")
        errors = True

    # password validation
    if not (re.search("[0-9]", request.form['password']) and re.search("[A-Z]", request.form['password'])):
        flash("*", "pword")
        flash("Password must contain a number and capital letter.", "messages")
        errors = True
    if len(request.form['password']) < 1:
        flash("*", "pword")
        length_error = True;
        errors = True
    elif len(request.form['password']) < 8:
        flash("*", "pword")
        flash("Password must be 8 or more characters.", "messages")
        errors = True
    if request.form['password'] != request.form['confirm_password']:
        flash("*", "pword")
        flash("*", "pconfirm")
        flash("Passwords do not match.", "messages")
        errors = True

    # email validation
    if len(request.form['email']) < 1:
        flash("*", "em_error")
        length_error = True
        errors = True
    if not re.search("^.+@.+\..+$", request.form['email']):
        flash("*", "em_error")
        flash("Please enter a valid email address.", "messages")
        errors = True
    # if date of birth valid

    # DOB validation
    # if len(request.form['date_of_birth']) < 1:
    #     flash("*", "dob")
    #     length_error = True
    # else:
    #     try:
    #         d_year = int(request.form['date_of_birth'][0:4])
    #         d_month = int(request.form['date_of_birth'][5:7])
    #         d_day = int(request.form['date_of_birth'][8:])
    #         d_submit = datetime(d_year, d_month, d_day)
    #         print d_submit
    #         # datetime.today()
    #         # print d_submit - datetime.today()
    #     except ValueError:
    #         flash("Invalid date entered.", "messages")

        # Add back to HTML:
        #   <tr>
        #     <td>Date of Birth</td>
        #     <td><input type="text" name="date_of_birth"/></td>
        #     <td>
        #       {%with d_errors = get_flashed_messages(category_filter=["dob"])%}
        #       {%if d_errors%}
        #         {{d_errors[0]}}
        #       {%endif%}
        #       {%endwith%}
        #     </td>
        #   </tr>

    # Generic length error
    if length_error:
        flash("Please enter all required fields!", "messages")

    # On success, go to landing page
    if not errors:
        session["first_name"] = request.form["first_name"]
        return redirect('/success')
    else:
        return redirect('/')

app.run(debug=True)
