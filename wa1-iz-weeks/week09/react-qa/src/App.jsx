import 'bootstrap/dist/css/bootstrap.min.css';
<<<<<<< HEAD
import { Col, Container, Row, Button, Form, Table } from 'react-bootstrap';
import { useState } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import dayjs from 'dayjs';
import AnswerRoute from './components/AnswerRoute';
import { FormRoute } from './components/AnswerForm';
//import './App.css';

function Question(id, text, author, date) {
  this.id = id;
  this.text = text;
  this.author = author;
  this.date = date;
  this.str = function () { return `Question ID ${id}: ${this.text} (by ${this.author}) on ${this.date.format('YYYY-MM-DD')}` }
}

function Answer(id, text, respondent, score, date, questionID) {
  this.id = id;
  this.text = text;
  this.respondent = respondent;
  this.score = score;
  this.date = date;
  this.questionID = questionID;
  this.str = function () { return `Answer ID ${id}: ${this.text} (by ${this.respondent}) on ${this.date.format('YYYY-MM-DD')}, score: ${this.score} [questionID: ${this.questionID}]` }
}

const staticQuestionList = [
  new Question(1, 'Best way of enumerating an array in JS?', 'Enrico', dayjs('2023-02-28')),
];

const staticAnswerList = [
  new Answer(1, 'for of', 'Alice', 3, dayjs('2023-03-07'), 1),
  new Answer(5, 'for i=0,i<N,i++', 'Harry', 1, dayjs('2023-03-04'), 1),
  new Answer(3, 'for in', 'Harry', -2, dayjs('2023-03-02'), 1),
  new Answer(6, 'i=0 while(i<N)', 'Carol', -1, dayjs('2023-03-01'), 1),
];


function DefaultRoute() {
  return(
    <Container className='App'>
      <h1>No data here...</h1>
      <h2>This is not the route you are looking for!</h2>
      <Link to='/'>Please go back to main page</Link>
    </Container>
  );
}
function App() {
  const [question, setQuestion] = useState(staticQuestionList[0]);
  const [answerList, setAnswerList] = useState(staticAnswerList);

  function increaseScore(id) {
    //console.log('increase score id: '+id);
    setAnswerList((oldList) => oldList.map((e) => {
      if (e.id === id) {
        return Object.assign({}, e, { score: e.score + 1 });
      } else {
        return e;
      }
    })
    )
  }

  const deleteAnswer = (id) => {
    setAnswerList((oldList) => oldList.filter(
      (e) => e.id !== id
    ));
  }

  const addAnswer = (e) => {
    setAnswerList((oldList) => {
      // Create a new temporary id, waiting for a truly unique id that can only be supplied by the server
      // This temporary id will be replaced when the server will provide its id.

      // NB: Math.max: do not forget ... (spread), max does not take an array as parameter
      const newTempId = Math.max(...oldList.map((e) => e.id)) + 1;
      e.id = newTempId;
      return [...oldList, e];
    }
    );
  }

  const editAnswer = (newEl) => {
    setAnswerList((oldList) => oldList.map((e) => {
      if (e.id === newEl.id) {
        return newEl;
      } else {
        return e;
      }
    }));
  }


  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={ <AnswerRoute question={question} answerList={answerList}
          increaseScore={increaseScore} addAnswer={addAnswer} deleteAnswer={deleteAnswer}
          editAnswer={editAnswer} /> } />
        <Route path='/add' element={ <FormRoute addAnswer={addAnswer} /> } />
        <Route path='/edit/:answerId' element={<FormRoute answerList={answerList}
          addAnswer={addAnswer} editAnswer={editAnswer} />} />
        <Route path='/*' element={<DefaultRoute />} />
      </Routes>
    </BrowserRouter>
  )
}


export default App
=======
import { Question, Answer } from './QAModels';
import { Container } from 'react-bootstrap';
import NavHeader from './components/NavbarComponents';
import { useState } from 'react';
import { BrowserRouter, Routes, Route, Outlet } from 'react-router-dom';
import SingleQuestion from './components/QuestionComponents';
import AnswerForm from './components/AnswerForm';
import NotFound from './components/NotFoundComponent';

const fakeQuestion = new Question(1, 'Is JavaScript better than Python?', 'Luigi De Russis', '2023-02-07');
const fakeAnswers = new Array(
  new Answer(1, 'Yes', 'Luca Mannella', '2023-02-15', 1, -10),
  new Answer(2, 'Not in a million year', 'Guido van Rossum', 1, '2023-03-02', 5),
  new Answer(3, 'No', 'Luigi De Russis', '2023-03-02', 1, 10),
  new Answer(4, 'Both have their pros and cons', 'Mario Rossi', 1, '2023-03-04'));

function App() {
  const [question, setQuestion] = useState(fakeQuestion);
  const [answers, setAnswers] = useState(fakeAnswers);

  const voteUp = (answerId) => {
    setAnswers(oldAnswer => {
      return oldAnswer.map((ans) => {
        if(ans.id === answerId) {
          // return the "updated" answer
          return new Answer(ans.id, ans.text, ans.name, ans.date, ans.questionId, ans.score +1);
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
          return new Answer(answer.id, answer.text, answer.name, answer.date, answer.questionId, answer.score);
        }
        else
          return ans;
      });
    });
  }

  return (
    <>
    <BrowserRouter>
      <Routes>
        {/* 
        - / (index) -> all the questions
        - /questions/:questionId -> the page with the :questionId question info and its answers
        - /questions/:questionId/addAnswer -> the form to add a new answer
        - /questions/:questionId/editAnswer/:answerId -> the form to update the :answerId answer
        - * -> not found
        */}
        <Route element={<><NavHeader questionNum={question.id} />
          <Container fluid className="mt-3">
            <Outlet />
          </Container></>} >
          <Route path='/questions/:questionId' 
            element={<SingleQuestion question={question} answers={answers} voteUp={voteUp}/>}/>
          <Route path='/questions/:questionId/addAnswer' 
            element={<AnswerForm addAnswer={addAnswer} lastId={Math.max([...answers.map(ans => ans.id)])} />} />
            <Route path='/questions/:questionId/editAnswer/:answerId' 
            element={<AnswerForm updateAnswer={updateAnswer} />} />
            <Route path='*' element={<NotFound/>} />
        </Route>
      </Routes>
    </BrowserRouter>
    </>
    
  )
}

export default App;
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
