html,
body {
    height: 100%;
}

body {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.pbHeader {
    display: none !important;
}


.bPageBlock {
    border: 0 solid transparent !important;
    background-color: transparent !important;
}

.body .bPageBlock, body #bodyCell .bResource .secondaryPalette, body .secondaryPalette.bPageBlock, body .individualPalette .secondaryPalette.bPageBlock, body .bodyDiv .genericTable, body .genericPageBlockTable, body .bodyDiv .bSubBlock, body .bComponentBlock .bPageBlock, body .bMyDashboard .bPageBlock, body.rlHoverFrame .bPageBlock, body.subjectSelectionPopup div.choicesBox, body.lookupTab .secondaryPalette.bPageBlock, body.popupTab .secondaryPalette.bPageBlock, body.UserTagStatsPage .secondaryPalette.bPageBlock {
    background-color: transparent;
}

nav, footer, header, aside {
    display: block;
}

.header {
    width: 100%;
    height: 80px;
    background: #d3d3d3;
    position: sticky;
}

.header__title {
    line-height: 80px;
    display: flex;
    justify-content: center;
    color: #044065;
    font-family: "Arial Narrow";
    font-size: 22px;
    letter-spacing: 3px;
    font-style: italic;
    text-shadow: 1.3px 1.3px #558ABB;
}

.header__title-img {
    margin: 7px 7px 0 7px;
}

.wrapper {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.content {
    display: flex;
    justify-content: space-around;
    margin: 0 auto;
    width: 90%;
}

.content__car {
    display: flex;
    justify-content: center;
    flex-direction: column;
    text-align: center;
    width: 65%;
    margin: 20px 0;
}

.content__car-title {
    font-size: 20px;
    letter-spacing: 2px;
    font-family: "Artifakt Element";
    color: #45a50d;
}

.content__car-block {
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    align-self: center;
}

.content__car-items {
    list-style-type: none;
    display: grid;
    justify-content: center;
    grid-template-columns: repeat(2, 1fr);
    grid-column-gap: 10px;
}

.content__car-item {
    display: flex;
    flex-direction: column;
    margin: 0px 0 15px 0;
}

.content__car-item-img:hover {
    transform: scale(2);
}

.content__car-item-name {
    font-size: 16px;
    font-weight: 800;
    letter-spacing: 1px;
    text-shadow: 1.3px 1.3px #558abb;
}

.content__car-item-year {
    font-size: 14px;
    letter-spacing: 1px;
    font-weight: 500;
}

.content__car-item-price {
    color: #5bc21b;
    font-size: 14px;
    letter-spacing: 2px;
}

.content__car-item-description {
    font-size: 14px;
    font-weight: 400;
    font-style: italic;
    font-family: 'Open Sans', sans-serif;
    color: #9c9a9a;
}

.content__car-bthPrevious {
    background: green !important;
}

.content__car-bthFilter {
    width: 50px !important;
    height: 25px !important;
    margin: 10px 0 !important;
    background: green !important;
}

.content__car-bthFilter:hover {
    background: #07b907 !important;
}

.content__car-bthNext {
    background: green !important;
}

.content__car-bthPrevious:hover {
    background: #07b907 !important;
}

.content__car-bthNext:hover {
    background: #07b907 !important;
}

.content__formOrder {
    display: flex;
    flex-direction: column;
    text-align: center;
    width: 35%;
    margin: 20px 0;
}

.content__formOrder-title {
    font-size: 20px;
    letter-spacing: 2px;
    font-family: "Artifakt Element";
    color: #ec1e1e;
}

.content__formOrder-block {
    display: flex;
    flex-direction: column;
}

.column {
    display: flex;
    flex-direction: column;
    text-align: left;
}

span {
    margin-bottom: 7px;
    font-size: 14px;
    letter-spacing: 1.5px;
    color: #445162;
    font-weight: 500;
}

.popup {
    display: none;
}

.customPopup {
    background-color: gray;
    opacity: 0.7;
    position: absolute;
    z-index: 9;
    width: 99.99% !important;
    min-height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}

.close-modal {
    width: 65px;
    height: 40px;
    background: white;
    border-radius: 4px;
    text-align: center;
    text-decoration: none;
    margin: 20px 0 0 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}


.btn {
    color: white !important;
    width: 75px;
    height: 40px;
    text-decoration: none;
    border-radius: 15%;
}

.send-button {
    margin: 20px 0 0 0 !important;
    background: green !important;
    display: flex;
    justify-content: center;
    align-items: center;
    align-self: center;
    text-decoration: none;
}

.send-button a:hover {
    text-decoration: none;
}


.send-button:hover {
    background: #07b907 !important;
    position: relative;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    top: 1px;
}

.buttons {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin: 0 auto;
}

.popup-message {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    position: absolute;
    top: 40%;
    left: 41%;
    font-size: 20px;
    color: #0234b6;
}

.content__formOrder-SuccessSend {
    position: relative;
    width: 100%;
    height: 100%;
}

.content__formOrder-successMessage {
    position: absolute;
    top: -50%;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 300px;
    height: 200px;
    left: -80%;
    margin-top: -100px;
}

.content__formOrder-successMessageContent {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #ddf5f6e0;
    border-radius: 40px;
}

.content__formOrder-successMessageText {
    font-size: 18px;
    letter-spacing: 2px;
    color: gray;
}

.content__formOrder-closeSuccessMessage {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 18px;
    text-decoration: none;
}

.footer {
    flex-grow: 0;
    flex-shrink: 0;
    flex-basis: auto;
}

.footer__block {
    background: #d3d3d3;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    height: 80px;
}

.footer__text {
    color: #445162;
    font-size: 13px;
    font-weight: 400;
    line-height: 80px;
    letter-spacing: 0.3px;
}

.footer__link {
    text-decoration: none;
    color: #445162;
    font-weight: bolder;
}

.footer__logo {
    width: 35px;
    height: 35px;
    position: relative;
    top: 10px;
}

.footer__link:hover {
    font-size: 14px;
}

@media screen and (max-height: 900px) {
    .customPopup {
        min-height: 149%;
    }
}

@media screen and (max-height: 500px) {
    .customPopup {
        min-height: 200%;
    }
}

.content__car-slidecontainer {
    width: 100%;

}

.content__car-slidecontainer p {
    font-family: "Artifakt Element";
    font-size: 15px;
}

.slider {
    -webkit-appearance: none;
    width: 50%;
    height: 15px;
    border-radius: 5px;
    background: #d3d3d3;
    outline: none;
    opacity: 0.7;
    -webkit-transition: .2s;
    transition: opacity .2s;
    margin: 15px 0;
}

.slider:hover {
    opacity: 1;
}

.slider::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 25px;
    height: 25px;
    border-radius: 50%;
    background: #04AA6D;
    cursor: pointer;
}

.slider::-moz-range-thumb {
    width: 25px;
    height: 25px;
    border-radius: 50%;
    background: #04AA6D;
    cursor: pointer;
}