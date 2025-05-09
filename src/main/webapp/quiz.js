const questions = [
    {
        question: "Who is this singer?",
        image: "img_quiz/gorgeous-taylor-swift.jpg.webp",
        answers: [
            { text: "Camila Cabello", correct: false },
            { text: "Taylor Swift", correct: true },
            { text: "Iggy Azalea", correct: false },
            { text: "Cardi B", correct: false },
        ]
    },
    {
        question: "Who is this?",
        image: "img_quiz/shallow-lady-gaga.jpg.webp",
        answers: [
            { text: "Jennifer Lopez", correct: false },
            { text: "Shakira", correct: false },
            { text: "Adele", correct: false },
            { text: "Lady Gaga", correct: true },
        ]
    },
    {
        question: "Name this Without Me singer?",
        image: "img_quiz/halsey.jpg.webp",
        answers: [
            { text: "Dua Lipa", correct: false },
            { text: "Halsey", correct: true },
            { text: "Sofia Richie", correct: false },
            { text: "Demi Lovato", correct: false },
        ]
    },
    {
        question: "Who is this?",
        image: "img_quiz/kesha.jpg.webp",
        answers: [
            { text: "Christina Aguilera", correct: false },
            { text: "Shakira", correct: false },
            { text: "Kesha", correct: true },
            { text: "Kelly Clarkson", correct: false },
        ]
    },
    {
        question: "Who is this?",
        image: "img_quiz/Son_Tung.jpg",
        answers: [
            { text: "Son Tung", correct: true },
            { text: "MCK", correct: false },
            { text: "BinZ", correct: false },
            { text: "HieuThuHai", correct: false },
        ]
    }
];

const questionElement = document.getElementById('question');
const answerButtons = document.getElementById('answer-button');
const nextButton = document.getElementById('next-btn-quiz');

let currentQuestionIndex = 0;
let score = 0;

function startQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    nextButton.innerHTML = "Next";
    showQuestion();
}

function showQuestion() {
    resetState();
    let currentQuestion = questions[currentQuestionIndex];
    let questionNo = currentQuestionIndex + 1;
    questionElement.innerHTML = questionNo + ". " + currentQuestion.question;

    const imageElement = document.createElement('img');
    imageElement.src = currentQuestion.image;
    answerButtons.appendChild(imageElement);

    currentQuestion.answers.forEach(answer => {
        const button = document.createElement('button');
        button.innerText = answer.text;
        button.classList.add('btn-quiz');
        answerButtons.appendChild(button);
        if(answer.correct) {
            button.dataset.correct = answer.correct;
        }
        button.addEventListener('click', selectAnswer);
    });
}

function resetState() {
    nextButton.style.display = 'none';
    while (answerButtons.firstChild) {
        answerButtons.removeChild(answerButtons.firstChild);
    }
}

function selectAnswer(e) {
    const selectedBtn = e.target;
    const isCorrect = selectedBtn.dataset.correct === "true";
    if(isCorrect) {
        selectedBtn.classList.add('correct');
        score++;
    } else {
        selectedBtn.classList.add('incorrect');
    }
    Array.from(answerButtons.children).forEach(button => {
        if(button.dataset.correct === "true") {
            button.classList.add('correct');
        }
        button.disabled = true;
    });
    nextButton.style.display = 'block';
}

function showScore() {
    resetState();
    questionElement.innerHTML = `You scored ${score} 
    out of ${questions.length}!`;
    nextButton.innerHTML = "Play Again";
    nextButton.style.display = 'block';
}

function handleNextButton() {
    currentQuestionIndex++;
    if(currentQuestionIndex < questions.length) {
        showQuestion();
    } else {
        showScore();
    }
}

nextButton.addEventListener('click', () => {
    if(currentQuestionIndex < questions.length) {
        handleNextButton();
    } else {
        startQuiz();
    }
});

startQuiz();