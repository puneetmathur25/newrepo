<div class='row' id='account'>
    <div class='col-sm-2 pull-left'>
        <h2><b><g:message code='account.label'/></b></h2>
    </div>
</div> <!-- end of account label -->
<form class='form-horizontal' role='form' id='account-form'>
    <div class='form-group'>
        <label class='col-sm-2 control-label' for='account.name'>
            <g:message code='name.label'/>
        </label>
        <div class='col-sm-6'>
            <input type='text' class='form-control' id='account.name' placeholder='Name'>
        </div>
    </div>
    <div class='form-group'>
        <label class='col-sm-2 control-label' for='account.password'>
            <g:message code='password.label'/>
        </label>
        <div class='col-sm-6'>
            <input type='password' class='form-control' id='account.password' placeholder='Password'>
        </div>
    </div>
    <div class='form-group'>
        <label class='col-sm-2 control-label' for='account.confirmPassword'>
            <g:message code='confirmPassword.label'/>
        </label>
        <div class='col-sm-6'>
            <input type='text' class='form-control' id='account.confirmPassword' 
                placeholder='Confirm Password'>
        </div>
    </div>
    <div class='form-group'>
        <div class='col-sm-offset-2 col-sm-10'>
            <button type='submit' class='btn btn-default'>
                <g:message code='button.save.label'/>
            </button>
        </div>
    </div>
</form> <!-- end of account-form -->
