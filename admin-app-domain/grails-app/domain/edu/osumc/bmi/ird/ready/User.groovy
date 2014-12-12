package edu.osumc.bmi.ird.ready

/**
 *User extends from SecUser of spring security.
 */
class User extends SecUser {

    String firstName
    String lastName
    String email

    Date dateCreated
    Date lastUpdated

    static constraints = {
        firstName blank: false, size: 3..16
        lastName blank: false, size: 3..16
        email blank: false, size: 3..32, unique: true, email: true
        dateCreated nullable: true
        lastUpdated nullable: true
    }
}
