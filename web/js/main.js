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
    methods: {}
})

var timers = [{
    name: '운동',
    on: true,
    elapsed: 0,
}, {
    name: '공부',
    on: false,
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
        item.elapsed += tick;
        return item;
    });
    setTimeout(upd, tick)
}, tick);
