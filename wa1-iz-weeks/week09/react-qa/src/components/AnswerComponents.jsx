import 'bootstrap-icons/font/bootstrap-icons.css';
<<<<<<< HEAD
import { Button, Table, Row, Col } from 'react-bootstrap';
import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { AnswerForm } from './AnswerForm';

function AnswerRow(props) {
  const { e } = props;
  return (
    <tr>
      <td>{e.date.format("YYYY-MM-DD")}</td>
      <td>{e.text}</td>
      <td>{e.respondent}</td>
      <td>{e.score}</td>
      <td><Button variant="primary" onClick={props.increaseScore}><i className='bi bi-arrow-up-circle' /></Button>
        <Link to={`/edit/${e.id}`}>
          <Button variant='secondary' className='mx-2'><i className='bi bi-pencil-square' /></Button>
        </Link>
        <Button variant="danger" onClick={props.deleteAnswer}><i className='bi bi-trash' /></Button></td>
    </tr>
  );
}

function MainAnswers(props) {

  const [objToEdit, setObjToEdit] = useState(undefined);  // state to keep the info about the object to edit

  const [sortOrder, setSortOrder] = useState('none');  // local state for visualization only, does not need to change the list in App

  const sortedAnswers = [...props.answerList];  // make a shallow copy
  // sort order is recomputed at each re-render: do NOT make a state with the sorted list!
=======
import { Row, Col, Table, Button } from 'react-bootstrap';
import { useState } from 'react';
import { Link } from 'react-router-dom';

function Answers(props) {
  return (
    <>
      <Row>
        <Col as="h2">Answers ({props.answers.length}):</Col>
      </Row>
      <Row>
        <Col lg={10} className="mx-auto">
          <AnswerTable answers={props.answers} voteUp={props.voteUp} addAnswer={props.addAnswer} updateAnswer={props.updateAnswer}></AnswerTable>
        </Col> 
      </Row>
    </>
  );
}

function AnswerTable(props) {
  const [showForm, setShowForm] = useState(false);
  const [sortOrder, setSortOrder] = useState('none');
  const [editableAnswer, setEditableAnswer] = useState();

  const sortedAnswers = [...props.answers];
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
  if (sortOrder === 'asc')
    sortedAnswers.sort((a,b) => a.score - b.score);
  else if (sortOrder === 'desc')
    sortedAnswers.sort((a,b) => b.score - a.score);
<<<<<<< HEAD
  
  const sortByScore = () => {
    setSortOrder( (oldSortOrder) => oldSortOrder === 'asc' ? 'desc' : 'asc' );
=======

  const sortByScore = () => {
    setSortOrder((oldOrder) => oldOrder === 'asc' ? 'desc' : 'asc');
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
  }

  return (
    <>
<<<<<<< HEAD
      <Row>
        <Col>
          <p className='fw-bold'>Answers ({props.answerList.length}):</p>
        </Col>
      </Row>
      <Row>
        <Col>
          <Table hover>
            {/* <Table striped bordered hover> */}
            <thead>
              <tr>
                <th>Date</th>
                <th>Text</th>
                <th>Author</th>
                <th>Score
                  <i className={'mx-1 '+(sortOrder ==='asc' ? 'bi bi-sort-numeric-up' : 'bi bi-sort-numeric-down')} onClick={sortByScore} style={{color: 'black'}}/>
                </th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {sortedAnswers.map((e) =>
                <AnswerRow e={e} key={e.id} increaseScore={() => props.increaseScore(e.id)}
                  editAnswer={() => { setObjToEdit(e); setShowForm(true); }}
                  deleteAnswer={() => props.deleteAnswer(e.id)} />)
              }
            </tbody>
          </Table>
        </Col>
      </Row>
      <Row>
        <Col>          
          <Link to='/add'>
            <Button variant='success'>Add answer</Button>
          </Link>
        </Col>
      </Row>
    </>
  )
}

export { MainAnswers, AnswerRow };
=======
      <Table striped>
        <thead>
          <tr>
            <th>Date</th>
            <th>Text</th>
            <th>Author</th>
            <th>Score <Button variant="link" onClick={sortByScore} style={{color: 'black'}}><i className={sortOrder === 'asc' ? 'bi bi-sort-numeric-up' : 'bi bi-sort-numeric-down'}></i></Button></th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {
            sortedAnswers.map((ans) => <AnswerRow answer={ans} key={ans.id} voteUp={props.voteUp} setShowForm={setShowForm} setEditableAnswer={setEditableAnswer}/>)
          }
        </tbody>
      </Table>

      <Link to="addAnswer" className="btn btn-success">Add</Link>
    </>
  );
}

function AnswerRow(props) {
  return(
    <tr><AnswerData answer={props.answer}/><AnswerActions voteUp={props.voteUp} answer={props.answer} setShowForm={props.setShowForm} setEditableAnswer={props.setEditableAnswer}/></tr>
  );
}

function AnswerData(props) {
  return(
    <>
      <td>{props.answer.date.format('YYYY-MM-DD')}</td>
      <td>{props.answer.text}</td>
      <td>{props.answer.name}</td>
      <td>{props.answer.score}</td>
    </>
  );
}

function AnswerActions(props) {
  return <td>
    <Button variant='primary' onClick={() => {props.setShowForm(true); props.setEditableAnswer(props.answer);}}><i className='bi bi-pencil-square'></i></Button> <Button variant='success' onClick={() => props.voteUp(props.answer.id)}><i className='bi bi-arrow-up'></i></Button>
    </td>
}

export default Answers;
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
