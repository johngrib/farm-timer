const template = `
    <div>
        <div v-for="item in timers">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted">{{item.name}}</small>
                            <small class="text-muted">{{(item.elapsed) | toTimeFormat}}</small>
                            <div class="btn-group">
                                <button v-if="item.on"
                                    type="button" class="btn btn-danger" v-on:click="toggle(item)">Stop</button>
                                <button v-else
                                    type="button" class="btn btn-success" v-on:click="toggle(item)">Start</button>
                                <button v-if="!item.on"
                                    type="button" class="btn btn-info" v-on:click="reset(item)">Reset</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
`;

const TIMER_KEY = 'farm-timer-timers';

Vue.component('timer-list', {
    template,
    props: {
        timers: Array,
    },
    computed: {},
    filters: {
        toTimeFormat: function(timestamp) {
            const time = new Date(timestamp);
            return time.getUTCHours() + ':' + time.getUTCMinutes() + ':' + time.getUTCSeconds();
        }
    },
    methods: {
        toggle: function(state) {
            state.on = !state.on;

            if (state.on) {
                this.start(state);
                return;
            }
            this.stop(state);
        },
        reset: function(state) {
            state.save = 0;
            state.started = 0;
            state.elapsed = 0;
            state.on = false;
            setData(TIMER_KEY, timers);
        },
        getElapsed: function(state) {
            return new Date().getTime() - state.started + state.save;
        },
        start: function(state) {
            console.log('start pressed')
            state.started = new Date().getTime();
            state.elapsed = state.save;
            setData(TIMER_KEY, timers);
        },
        stop: function(state) {
            console.log('stop pressed')
            state.save += new Date().getTime() - state.started;
            console.log(state.started);
            setData(TIMER_KEY, timers);
        },
    }
})

let timers;

if (!localStorage.getItem(TIMER_KEY)) {
    initStorage();
}
timers = getData(TIMER_KEY);

function initStorage() {
    let timers = [{
        name: '운동',
        on: false,
        save: 0,
        started: 0,
        elapsed: 0,
    }, {
        name: '공부',
        on: false,
        save: 0,
        started: 0,
        elapsed: 0,
    }];
    setData(TIMER_KEY, timers);
}

function setData(key, obj) {
    localStorage.setItem(key, JSON.stringify(obj));
}

function getData(key) {
    return JSON.parse(localStorage.getItem(key));
}

new Vue({
    el: '#my-timers',
    data: {
        timers
    }
});

const tick = 100;

setTimeout(function upd() {
    timers = timers.map(function(item) {
        if (item.on) {
            item.elapsed = new Date().getTime() - item.started + item.save;
        }
        return item;
    });
    setTimeout(upd, tick)
}, tick);
