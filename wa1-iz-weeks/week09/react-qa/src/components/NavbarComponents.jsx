<<<<<<< HEAD
import { Navbar, Container } from "react-bootstrap";

function NavHeader(props) {
    return (
        <Navbar bg='primary' variant='dark'>
            <Container fluid>
                <Navbar.Brand className='fs-2'>{props.appName || "HeapOverrun"}</Navbar.Brand>
            </Container>
        </Navbar>
    );
=======
import { Navbar, Container } from 'react-bootstrap';

function NavHeader(props) {
  return (
  <Navbar bg="primary" variant="dark">
    <Container fluid>
      <Navbar.Brand>HeapOverrun - Question {props.questionNum}</Navbar.Brand>
    </Container>
  </Navbar>
  );
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
}

export default NavHeader;