import 'bootstrap/dist/css/bootstrap.min.css';
<<<<<<< HEAD
import { Question, Answer } from './QAModels';
import { Container } from 'react-bootstrap';
import Answers from './components/AnswerComponents';
import NavHeader from './components/NavbarComponents';
import QuestionDescription from './components/QuestionComponents';
import { useState } from 'react';

const fakeQuestion = new Question(1, 'Is JavaScript better than Python?', 'Luigi De Russis', '2023-02-07');
const fakeAnswers = new Array(
  new Answer(1, 'Yes', 'Luca Mannella', '2023-02-15', -10),
  new Answer(2, 'Not in a million year', 'Guido van Rossum', '2023-03-02', 5),
  new Answer(3, 'No', 'Luigi De Russis', '2023-03-02', 10),
  new Answer(4, 'Both have their pros and cons', 'Mario Rossi', '2023-03-04'));

function App() {
  const [question, setQuestion] = useState(fakeQuestion);
  const [answers, setAnswers] = useState(fakeAnswers);

  const voteUp = (answerId) => {
    setAnswers(oldAnswer => {
      return oldAnswer.map((ans) => {
        if(ans.id === answerId) {
          // return the "updated" answer
          return new Answer(ans.id, ans.text, ans.name, ans.date, ans.score +1);
        }
        else
          return ans;
      });
    });
  }

  const addAnswer = (answer) => {
    setAnswers((oldAnswers) => [...oldAnswers, answer]);
  }

  const updateAnswer = (answer) => {
    setAnswers(oldAnswer => {
      return oldAnswer.map((ans) => {
        if(ans.id === answer.id) {
          return new Answer(answer.id, answer.text, answer.name, answer.date, answer.score);
        }
        else
          return ans;
      });
    });
  }

  return (
    <>
      <NavHeader questionNum={question.id} />
      <Container fluid className="mt-3">
        <QuestionDescription question={question} />
        <Answers answers={answers} voteUp={voteUp} addAnswer={addAnswer} updateAnswer={updateAnswer}></Answers>
      </Container>
    </>
    
  )
}

export default App;
=======
import { Col, Container, Row, Button, Form, Table } from 'react-bootstrap';
import { useState } from 'react';
import dayjs from 'dayjs';
import AnswerForm from './AnswerForm';
//import './App.css';


function Answer(id, text, respondent, score, date) {
  this.id = id;
  this.text = text;
  this.respondent = respondent;
  this.score = score;
  this.date = date;
  this.str = function () { return `ID ${id}: ${this.text} (by ${this.respondent}) on ${this.date.format('YYYY-MM-DD')}, score: ${this.score}` }
}


const answerList = [
  new Answer(1, 'for of', 'Alice', 3, dayjs('2023-03-07')),
  new Answer(5, 'for i=0,i<N,i++', 'Harry', 1, dayjs('2023-03-04')),
  new Answer(3, 'for in', 'Harry', -2, dayjs('2023-03-02')),
  new Answer(6, 'i=0 while(i<N)', 'Carol', -1, dayjs('2023-03-01')),
];

function MyHeader(props) {
  return (
    <header>
      <h1>{props.appName || "HeapOverrun"}</h1>
    </header>
  );
}


function MyFooter(props) {
  return (<footer>
    <p>&copy; 2023, Applicazioni Web I</p>
    <div id="time"></div>
  </footer>);
}

function MyRow(props) {
  const { e } = props;
  return (
    <tr>
      <td>{e.date.format("YYYY-MM-DD")}</td>
      <td>{e.text}</td>
      <td>{e.respondent}</td>
      <td>{e.score}</td>
      <td><Button variant="primary" onClick={props.increaseScore}>Vote</Button>
        <Button variant="secondary" onClick={props.editRow} className='mx-2'>Edit</Button>
        <Button variant="danger" onClick={props.deleteRow}>Delete</Button></td>
    </tr>
  );
}

function MyTable(props) {
  const [list, setList] = useState(props.listOfAnswers);

  const [showForm, setShowForm] = useState(false);

  const [editObj, setEditObj] = useState(undefined);  // state to keep the info about the object to edit

  function increaseScore(id) {
    //console.log('increase score id: '+id);
    setList((oldList) => oldList.map((e) => {
      if (e.id === id) {
        return Object.assign({}, e, { score: e.score + 1 });
      } else {
        return e;
      }
    })
    )
  }

  const deleteRow = (id) => {
    setList((oldList) => oldList.filter(
      (e) => e.id !== id
    ));
  }

  const addToList = (e) => {
    setList((oldList) => [...oldList, e]);
    setShowForm(false);
  }

  const editRow = (newEl) => {
    setList((oldList) => oldList.map((e) => {
      if (e.id === newEl.id) {
        return newEl;
      } else {
        return e;
      }
    }));
    setEditObj(undefined);
    setShowForm(false);
  }

  return (
    <div>
      <Table>
        {/* <Table striped bordered hover> */}
        <thead>
          <tr>
            <th>Date</th>
            <th>Text</th>
            <th>Author</th>
            <th>Score</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {list.map((e, i) =>
            <MyRow e={e} key={i} increaseScore={() => increaseScore(e.id)}
              editRow={() => { setEditObj(e); setShowForm(true); }}
              deleteRow={() => deleteRow(e.id)} />)
          }
        </tbody>
      </Table>
      {/* key is needed because when the key value changes, the component is re-created
        so the component state is re-initialized with the values of the new object.
        This can happen when pressing edit on one and then another element without closing the form.
     */}
      {showForm ?
        <AnswerForm addToList={addToList} key={editObj ? editObj.id : -1}
          closeForm={() => { setShowForm(false); setEditObj(undefined); }}
          editObj={editObj} editRow={editRow} />
        : <Button onClick={() => setShowForm(true)}>Add element</Button>}
    </div>
  )
}


function Main(props) {
  return (<>
    <Row>
      <Col xs={9}>
        <p>Question: Best way of enumerating an array in JS</p>
      </Col>
      <Col xs={3}>
        <p>Author: Enrico</p>
      </Col>
    </Row>
    <Row>
      <h2>Current Answers</h2>
    </Row>
    <Row>
      <MyTable listOfAnswers={answerList} />
    </Row>
  </>
  );
}

function App() {

  return (
    <Container fluid>
      <MyHeader />
      <Main />
      <MyFooter />
    </Container>
  )
}

export default App
>>>>>>> 80a6aee23c94f5b50a9c8d4f8289ee8e5e300680
