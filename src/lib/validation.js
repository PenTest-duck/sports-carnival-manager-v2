// @ts-nocheck

// Function: validateName()
// Purpose: check name is alphabet only and is not too long
// Parameters: name
// Returns: True (valid) or False (invalid)
export function validateName(name) {
    // Check name matches regex of alphabet characters
    const validNameRegex = /^[A-Za-z]*$/
    let nameIsValid = Boolean(name.match(validNameRegex));

    // Check name does not exceed 200 characters
    if (name.length > 200) {
        nameIsValid = false;
    }

    return nameIsValid;
}