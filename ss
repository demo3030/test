import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;

import java.util.List;
import java.util.Map;

@ExtendWith(MockitoExtension.class)
class ValidationExceptionHandlerTest {

    @InjectMocks
    private YourExceptionHandler handler;  // Replace with actual handler class name

    @Test
    void testHandleValidationExceptions_SingleField() {
        // Mock FieldError
        FieldError fieldError = new FieldError("objectName", "field1", "must not be null");

        // Mock BindingResult
        BindingResult bindingResult = mock(BindingResult.class);
        when(bindingResult.getFieldErrors()).thenReturn(List.of(fieldError));

        // Mock Exception
        MethodArgumentNotValidException exception = new MethodArgumentNotValidException(null, bindingResult);

        // Invoke handler
        ResponseEntity<Map<String, String>> response = handler.handleValidationExceptions(exception);

        // Assertions
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals("Mandatory Attribute field1 is missing.", response.getBody().get("error"));
    }

    @Test
    void testHandleValidationExceptions_MultipleFields() {
        // Mock multiple FieldErrors
        FieldError fieldError1 = new FieldError("objectName", "field1", "must not be null");
        FieldError fieldError2 = new FieldError("objectName", "field2", "must not be blank");

        // Mock BindingResult
        BindingResult bindingResult = mock(BindingResult.class);
        when(bindingResult.getFieldErrors()).thenReturn(List.of(fieldError1, fieldError2));

        // Mock Exception
        MethodArgumentNotValidException exception = new MethodArgumentNotValidException(null, bindingResult);

        // Invoke handler
        ResponseEntity<Map<String, String>> response = handler.handleValidationExceptions(exception);

        // Assertions
        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals("Mandatory Attributes field1, field2 are missing.", response.getBody().get("error"));
    }
}
