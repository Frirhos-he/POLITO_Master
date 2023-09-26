<<<<<<< HEAD
import { Row, Col} from 'react-bootstrap';



function QuestionDescription(props) {
    return (
        <Row>
            <Col xs={9}>
                <p className='fs-4'>Question: {props.question.text}</p>
            </Col>
            <Col xs={3}>
                <p className='fs-5'>Asked by: <span className="badge text-bg-secondary text-end">{props.question.author}</span></p>
            </Col>
        </Row>       
    );
}

export default QuestionDescription;
=======
import { Row, Col } from 'react-bootstrap';
import Answers from './AnswerComponents';

function SingleQuestion(props) {
  return(
    <>
      <QuestionDescription question={props.question} />
      <Answers answers={props.answers} voteUp={props.voteUp}></Answers>
    </>
  );
}

function QuestionDescription(props) {
  return (
    <>
      <Row>
        <QuestionHeader questionNum={props.question.id} author={props.question.author} />
      </Row>
      <Row>
        <QuestionText text={props.question.text} />
      </Row>
    </>
  );
}

function QuestionHeader(props) {
  return (
    <>
      <Col md={6} as="p">
        <strong>Question #{props.questionNum}:</strong>
      </Col>
      <Col md={6} as="p" className="text-end">
        Asked by <span className="badge rounded-pill text-bg-secondary text-end">{props.author}</span>
      </Col>
    </>
  );
}

function QuestionText(props) {
  return (
    <Col as="p" className="lead">{props.text}</Col>
  );
}

export default SingleQuestion;
>>>>>>> ec6a2a1eb4db1ef726fd908325d1b1a20192283a
