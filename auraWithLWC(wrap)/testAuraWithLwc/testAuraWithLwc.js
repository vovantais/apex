import {LightningElement} from 'lwc';

export default class TestAuraWithLwc extends LightningElement {

    handleChange() {
        const filters = Array.from(
            this.template.querySelectorAll('lightning-input'),
        )
            .filter(element => element.checked)
            .map(element => element.label);

        this.dispatchEvent(new CustomEvent('filterchange', {detail: {filters}}));
    }
}