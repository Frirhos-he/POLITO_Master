<<<<<<< HEAD
import { Col, Container, Row, Button, Form, Table, Alert } from 'react-bootstrap';
import { useState } from 'react';
import { useNavigate, useParams, Link } from 'react-router-dom';
import dayjs from 'dayjs';
import NavHeader from './NavbarComponents';

function FormRoute(props) {
    return (
        <>
            <NavHeader />
            <Container fluid>
                <AnswerForm answerList={props.answerList} addAnswer={props.addAnswer}
                    editAnswer={props.editAnswer} />
            </Container>
        </>
    );
}

function AnswerForm(props) {
    const navigate = useNavigate();

        /* If we have an answerId in the URL, we retrieve the answer to edit from the list.
       In a full-stack application, starting from the answerId, 
       we could query the back-end to retrieve all the answer data (updated to last value). */
       
       const { answerId } = useParams();
       //console.log(answerId);
       const objToEdit = answerId && props.answerList.find(e => e.id === parseInt(answerId));
       //console.log(objToEdit);
       
    const [date, setDate] = useState(objToEdit ? objToEdit.date.format('YYYY-MM-DD') : dayjs().format('YYYY-MM-DD'));  //string: dayjs object is created only on submit
    const [text, setText] = useState(objToEdit ? objToEdit.text : '');
    const [respondent, setRespondent] = useState(objToEdit ? objToEdit.respondent : '');
    const [score, setScore] = useState(objToEdit ? objToEdit.score : 0);

    const [errorMsg, setErrorMsg] = useState('');

    function handleRespondent(event) {
        const v = event.target.value;
        setRespondent(v);
    }

    const handleScore = (ev) => {
        const v = ev.target.value;
        setScore(v);
    }

    function handleSubmit(event) {
        event.preventDefault();
        //console.log('premuto submit');

        // Form validation
        if (date === '')
            setErrorMsg('Data non valida');
        else if (isNaN(parseInt(score)))
            setErrorMsg('Score non valido');
        else if (parseInt(score)<0) {
            setErrorMsg('Score negativo non valido');
        }
        else {
            const e = {
                text: text,
                respondent: respondent,
                score: parseInt(score),
                date: dayjs(date)
            }
            //console.log(e);

            if (objToEdit) {  // decide if this is an edit or an add
                e.id = objToEdit.id;
                props.editAnswer(e);
            } else
                props.addAnswer(e);
            navigate('/');
        }
    }

    return (
        <>
        {errorMsg? <Alert variant='danger' onClose={()=>setErrorMsg('')} dismissible>{errorMsg}</Alert> : false }
        <Form onSubmit={handleSubmit}>
            <Form.Group className='mb-3'>
                <Form.Label>Date</Form.Label>
                <Form.Control type="date" name="date" value={date} onChange={ev => setDate(ev.target.value)} />
            </Form.Group>

            <Form.Group className='mb-3'>
                <Form.Label>Text</Form.Label>
                <Form.Control type="text" name="text" value={text} onChange={ev => setText(ev.target.value)} />
            </Form.Group>

            <Form.Group className='mb-3'>
                <Form.Label>Respondent</Form.Label>
                <Form.Control type="text" name="respondent" value={respondent} onChange={handleRespondent} />
            </Form.Group>

            <Form.Group className='mb-3'>
                <Form.Label>Score</Form.Label>
                <Form.Control type="number" name="score" value={score} onChange={handleScore} />
            </Form.Group>

            <Button type='submit' variant="primary">{props.objToEdit? 'Save' : 'Add'}</Button> 
            {/* alternative
            <Button className='mx-2' variant='danger' onClick={()=>navigate('/')}>Cancel</Button> */}
            <Link to='/'>
                <Button className='mx-2' variant='danger'>Cancel</Button>
            </Link>
        </Form>
        </>
    );

}

export { AnswerForm, FormRoute };



=======
import { useState } from 'react';
import { Form, Button } from 'react-bootstrap';
import { Answer } from '../QAModels';
import dayjs from 'dayjs';
import { useNavigate, Link } from 'react-router-dom';

function AnswerForm(props) {
  const navigate = useNavigate();
  const questionId = props.answer ? props.answer.questionId : 1;
  
  const [id, setId] = useState(props.answer ? props.answer.id : props.lastId + 1);
  const [text, setText] = useState(props.answer ? props.answer.text : '');
  const [name, setName] = useState(props.answer ? props.answer.name : '');
  const [date, setDate] = useState(props.answer ? props.answer.date.format('YYYY-MM-DD') : dayjs().format('YYYY-MM-DD'));
  const [score, setScore] = useState(props.answer ? props.answer.score : 0);

  const handleSubmit = (event) => {
    event.preventDefault();
    // create a new answer
    const answer = new Answer(id, text, name, date, questionId, score);
    // TODO: add validations!
    if(props.answer) {
      props.updateAnswer(answer);
    }
    else {
      // add the answer to the "answers" state
      props.addAnswer(answer);
      navigate(`/questions/${answer.questionId}`);
      //navigate('..', {relative:'path'});
    }
  }

  return (
    <Form onSubmit={handleSubmit}>
      <Form.Group className='mb-3'>
        <Form.Label>Text</Form.Label>
        <Form.Control type="text" minLength={2} required={true} value={text} onChange={(event) => setText(event.target.value)}></Form.Control>
      </Form.Group>
      <Form.Group className='mb-3'>
        <Form.Label>Name</Form.Label>
        <Form.Control type="text" required={true} value={name} onChange={(event) => setName(event.target.value)}></Form.Control>
      </Form.Group>
      <Form.Group className='mb-3'>
        <Form.Label>Date</Form.Label>
        <Form.Control type="date" value={date} onChange={(event) => setDate(event.target.value)}></Form.Control>
      </Form.Group>
      <Button variant="primary" type="submit">Add</Button> <Link to=".." relative="path" className="btn btn-danger">Cancel</Link>
    </Form>
  );
}

export default AnswerForm;
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
