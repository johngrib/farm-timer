Vue.component('timer-list', {
    template: '#timer-template',
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
                console.log('start pressed')
                state.started = new Date().getTime();
                state.elapsed = state.save;
            } else {
                console.log('stop pressed')
                state.save += new Date().getTime() - state.started;
            }
        },
        getElapsed: function(state) {
            return new Date().getTime() - state.started + state.save;
        }
    }
})

var timers = [{
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

// bootstrap the demo
var demo = new Vue({
    el: '#demo',
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
