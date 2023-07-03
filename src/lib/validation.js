// @ts-nocheck

// Define static values
const MAX_NAME_LENGTH = 200;
const MIN_NUMBER = 1;
const MAX_NUMBER = 1000000000; // One billion

// Define regex 
const VALID_NAME_REGEX = /^[A-Za-z]*$/;
const VALID_NUMBER_REGEX = /^\d+$/;   // Can only contain digits - culls out decimals

// Function: validateName()
// Purpose: check name is alphabet only and is not too long
// Parameters: name
// Returns: True (valid) or False (invalid)
export function validateName(name) {
    // Check name only contains alphabet
    let nameIsValid = Boolean(name.match(VALID_NAME_REGEX));

    // Check name does not exceed 200 characters
    if (name.length > MAX_NAME_LENGTH) {
        nameIsValid = false;
    }

    return nameIsValid;
}

// Function: validateNumber()
// Purpose: check number is an integer within the accepted range
// Parameters: number
// Returns: True (valid) or False (invalid)
export function validateNumber(number) {
    // Check number is an integer
    let numberIsValid = Boolean(number.match(VALID_NUMBER_REGEX));

    // Check number is within the valid range
    if (numberIsValid) {
        if (number < MIN_NUMBER || number > MAX_NUMBER) {
            numberIsValid = false;
        }
    }

    return numberIsValid;
}