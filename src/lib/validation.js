// @ts-nocheck
// Imports
import { sequelize } from "../hooks.server"; 

// Define static values
export const MAX_STR_LENGTH = 200;
const MIN_NUMBER = 1;
const MAX_NUMBER = 999999999; // Less than one billion 
const MIN_PASSWORD_LENGTH = 8;
const MAX_PASSWORD_LENGTH = 40;

// Define regex 
const VALID_NAME_REGEX = /^[A-Za-z '\-,.]+$/;
export const VALID_NUMBER_REGEX = /^\d+$/;   // Can only contain digits - culls out decimals
const VALID_DATE_REGEX = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/; // YYYY-MM-DD (limited to year 2999)
const VALID_TIME_REGEX = /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/; // HH:MM (24 hour)
const VALID_RESULT_REGEX = /^[+]?([0-9]+([.][0-9]*)?|[.][0-9]+)$/; // positive float value
export const VALID_EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

const LOWERCASE_REGEX = /[a-z]/;
const UPPERCASE_REGEX = /[A-Z]/;
const NUMBER_REGEX = /\d/;
const SYMBOL_REGEX = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;

// Define accepted values
const MAX_CARNIVAL_TYPE = 3;
const MAX_CARNIVAL_LOCATION = 3;
const MAX_EVENT_TYPE = 26;
const MAX_EVENT_AGE_GROUP = 6;
const MAX_EVENT_DIVISION = 10;
const MAX_HOUSE = 11;

// Function: validatePersonName()
// Purpose: check name is alphabet only and is not too long
// Parameters: name
// Returns: "Valid" OR error message
export function validatePersonName(name) {
    // Check name only contains alphabet or common symbols
    if (!Boolean(name.match(VALID_NAME_REGEX))) {
        return "Name can only contain alphabet";
    }

    // Check name does not exceed 200 characters
    if (name.length > MAX_STR_LENGTH) {
        return `Name cannot exceed ${MAX_STR_LENGTH} characters`;
    }

    return "Valid";
}

// Function: validateName()
// Purpose: check non-person name (e.g. carnival name) is not too long
// Parameters: name
// Returns "Valid" OR error message
export function validateName(name) {
    // Check name does not exceed 200 characters
    if (name.length > MAX_STR_LENGTH) {
        return `Name cannot exceed ${MAX_STR_LENGTH} characters`;
    }

    return "Valid";
}

// Function: validateNumber()
// Purpose: check number is an integer within the accepted range
// Parameters: number
// Returns: "Valid" OR error message
export function validateNumber(number) {
    // Check number is an integer
    if (!Boolean(number.match(VALID_NUMBER_REGEX))) {
        return "Number can only have digits";         // return early here to prevent errors with number comparisons next
    }

    // Check number is within the valid range
    if (Number(number) < MIN_NUMBER || Number(number) > MAX_NUMBER) {
        return "Number out of range";
    }

    return "Valid";
}

// Function: validateDate()
// Purpose: check date is in valid format and not before today
// Parameters: date
// Returns: "Valid" OR error message
export function validateDate(date) {
    // Check date matches YYYY-MM-DD
    if (!Boolean(date.match(VALID_DATE_REGEX))) {
        return "Date is in invalid format";
    }

    // Check date is not before today
    const todayDate = new Date().toISOString().split('T')[0];
    
    if (date < todayDate) {
        return "Date must not be before today";
    }

    return "Valid";
}

// Function: validateTime()
// Purpose: check time is in valid format
// Parameters: time
// Returns: "Valid" OR error message
export function validateTime(time) {
    // Check time matches HH:MM
    if (!Boolean(time.match(VALID_TIME_REGEX))) {
        return "Time is in invalid format";
    }

    return "Valid";
}

// Function: validateEmail()
// Purpose: check email conforms to valid format AND does not already exist in the database
// Parameters: email
// Returns: "Valid" OR error message
export async function validateEmail(email) {
    // Check email does not exceed 200 characters
    if (email.length > MAX_STR_LENGTH) {
        return `Email cannot exceed ${MAX_STR_LENGTH} characters`;
    }

    // Check email matches regex of valid email addresses
    if (!Boolean(email.match(VALID_EMAIL_REGEX))) {
        return "Email is not in a valid format";
    }

    // Fetch all rows in staff that match the email
    try {
        const existingEmail = await sequelize.query("SELECT * FROM staff WHERE email = :email", {
            replacements: { email: email }
        });

        // If any rows are returned, that means an account already exists
        if (existingEmail[0][0] != null) {
            return "Account for this email already exists";
        }
    } catch (e) {
        console.log("Error: ", e);
        return "There was an unexpected error with the server";
    }

    return "Valid";
}

// Function: validatePassword()
// Purpose: check password matches complexity requirements
// Parameters: password
// Returns: "Valid" OR error message
export function validatePassword(password) {
    // Password complexity requirement: check password length is at least 8
    if (password.length < MIN_PASSWORD_LENGTH) {
        return `Password must be at least ${MIN_PASSWORD_LENGTH} characters`;
    }

    // Ensure password is not too long
    if (password.length > MAX_PASSWORD_LENGTH) {
        return `Password must not exceed ${MAX_PASSWORD_LENGTH} characters`;
    }

    // Password complexity requirement: check at least 1 lowercase letter exists in password
    if (!Boolean(password.match(LOWERCASE_REGEX))) {   
        return "Password must have at least 1 lowercase letter";
    }

    // Password complexity requirement: check at least 1 uppercase letter exists in password
    if (!Boolean(password.match(UPPERCASE_REGEX))) {  
        return "Password must have at least 1 uppercase letter";
    }

    // Password complexity requirement: check at least 1 number exists in password
    if (!Boolean(password.match(NUMBER_REGEX))) {   
        return "Password must have at least 1 number";
    }

    // Password complexity requirement: check at least 1 symbol exists in password
    if (!Boolean(password.match(SYMBOL_REGEX))) {  
        return "Password must have at least 1 symbol";
    }

    return "Valid";
}

// Function: validateID()
// Purpose: check ID is within accepted values
// Parameters: ID, maximum accepted value, name of ID
// Returns: "Valid" OR error message
function validateID(id, maxValue, idName) {
    // Check ID is a valid number
    if (Boolean(id.match(VALID_NUMBER_REGEX))) {
        // Check ID is within accepted range
        if (1 <= parseInt(id) && parseInt(id) <= maxValue) {
            return "Valid";
        }
    }

    return `Invalid ${idName} ID. Please try again.`;
}

// Function: validateCarnival()
// Purpose: perform validation on all parameters for carnival
// Parameters: name, type ID, date, start time, end time, location ID, staff ID
// Returns: "Valid" OR error message
export function validateCarnival(name, typeID, date, startTime, endTime, locationID, staffID) {
    // Validate name
    const nameValidityMessage = validateName(name);
    if (nameValidityMessage != "Valid") {
        return nameValidityMessage;
    }

    // Validate type ID
    const typeIDValidityMessage = validateID(typeID, MAX_CARNIVAL_TYPE, "carnival type");
    if (typeIDValidityMessage != "Valid") {
        return typeIDValidityMessage;
    }

    // Validate date
    const dateValidityMessage = validateDate(date);
    if (dateValidityMessage != "Valid") {
        return dateValidityMessage;
    }

    // Validate start time
    const startTimeValidityMessage = validateTime(startTime);
    if (startTimeValidityMessage != "Valid") {
        return startTimeValidityMessage;
    }

    // Validate end time
    const endTimeValidityMessage = validateTime(endTime);
    if (endTimeValidityMessage != "Valid") {
        return endTimeValidityMessage;
    }

    // Validate location ID
    const locationIDValidityMessage = validateID(locationID, MAX_CARNIVAL_LOCATION, "carnival location");
    if (locationIDValidityMessage != "Valid") {
        return locationIDValidityMessage;
    }

    // Check end time is not before start time
    // Direct string comparison possible as both are in 24-hour format
    if (endTime < startTime) {
        return "End time cannot be before start time";
    }

    return "Valid";
}

// Function: validateEvent()
// Purpose: perform validation on all parameters for event
// Parameters: carnival/event ID, type ID, age group ID, division ID, event start time, carnival start time, carnival end time + mode (add/edit)
// Returns: "Valid" OR error message
export async function validateEvent(mode, carnivalOrEventID, typeID, ageGroupID, divisionID, startTime, minTime, maxTime) {

    // For adding, validate carnival exists
    // For editing, validate event exists
    if (!Boolean(carnivalOrEventID.match(VALID_NUMBER_REGEX))) {
        return "Invalid carnival or event ID. Please try again.";
    }

    try {
        if (mode == "add") {
            // Check carnival exists
            const existingCarnival = await sequelize.query("SELECT * FROM carnivals WHERE id = :carnivalID", {
                replacements: { carnivalID: carnivalOrEventID }
            });

            if (existingCarnival[0][0] == null) {
                return "Invalid carnival ID. Please try again.";
            }
        } else {
            // Check event exists
            const existingEvent = await sequelize.query("SELECT * FROM events WHERE id = :eventID", {
                replacements: { eventID: carnivalOrEventID }
            });

            if (existingEvent[0][0] == null) {
                return "Invalid event ID. Please try again.";
            }
        }
    } catch (e) {
        console.log("Error: ", e);
        return "There was an unexpected error with the server";
    }

    // Validate type ID
    const typeIDValidityMessage = validateID(typeID, MAX_EVENT_TYPE, "event type");
    if (typeIDValidityMessage != "Valid") {
        return typeIDValidityMessage;
    }

    // Validate age group ID
    const ageGroupIDValidityMessage = validateID(ageGroupID, MAX_EVENT_AGE_GROUP, "event age group");
    if (ageGroupIDValidityMessage != "Valid") {
        return ageGroupIDValidityMessage;
    }

    // Validate division ID
    const divisionIDValidityMessage = validateID(divisionID, MAX_EVENT_DIVISION, "event division");
    if (divisionIDValidityMessage  != "Valid") {
        return divisionIDValidityMessage;
    }

    // Validate start time
    const startTimeValidityMessage = validateTime(startTime);
    if (startTimeValidityMessage != "Valid") {
        return startTimeValidityMessage;
    }

    // Validate start time is within range of carnival start and end times
    // Direct string comparison possible as all are in 24-hour format
    if (startTime < minTime || startTime > maxTime) {
        return `Event start time must be between carnival start and end times (${minTime.slice(0, -3)} - ${maxTime.slice(0, -3)})`;
    }

    return "Valid";
}

// Function: validateResult()
// Purpose: perform validation on all parameters for student
// Parameters: event ID, student ID, result
// Returns "Valid" OR error message
export async function validateResult(eventID, studentID, result) {
    // Check event ID is valid
    if (!Boolean(eventID.match(VALID_NUMBER_REGEX))) {
        return "Invalid event ID. Please try again.";
    }

    // Check event exists
    const existingEvent = await sequelize.query("SELECT * FROM events WHERE id = :eventID", {
        replacements: { eventID: eventID }
    });

    if (existingEvent[0][0] == null) {
        return "Invalid event ID. Please try again."
    }

    // Check student ID is valid
    if (!Boolean(studentID.match(VALID_NUMBER_REGEX))) {
        return "Invalid student ID. Please try again.";
    }

    // Check student exists
    const existingStudent = await sequelize.query("SELECT * FROM students WHERE id = :studentID", {
        replacements: { studentID: studentID }
    });

    if (existingStudent[0][0] == null) {
        return "Invalid student ID. Please try again."
    }

    // Check result is a valid non-negative float
    if (!Boolean(result.match(VALID_RESULT_REGEX))) {
        return "Result is in an invalid format";
    }

    return "Valid";
}

// Function: validateStudent()
// Purpose: perform validation on all parameters for student
// Parameters: first name, last name, house ID, student number
// Returns: "Valid" OR error message
export function validateStudent(firstName, lastName, houseID, number) {
    // Validate first name
    const firstNameValidityMessage = validatePersonName(firstName);
    if (firstNameValidityMessage != "Valid") {
        return firstNameValidityMessage;
    }

    // Validate last name
    const lastNameValidityMessage = validatePersonName(lastName);
    if (lastNameValidityMessage != "Valid") {
        return lastNameValidityMessage;
    }

    // Validate house ID
    const houseIDValidityMessage = validateID(houseID, MAX_HOUSE, "house");
    if (houseIDValidityMessage != "Valid") {
        return houseIDValidityMessage;
    }

    // Validate number
    const numberValidityMessage = validateNumber(number);
    if (numberValidityMessage != "Valid") {
        return numberValidityMessage;
    }

    return "Valid";
}