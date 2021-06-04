var formData = {
    name: '',
    components: []
};

var componentData = {
    type: '',
    data: null,
    isTitle: false,
    isRequired: true,
    max: null,
    min: null,
    datetime_format: null,
    set_to_current_datetime: false,
    possible_answers: [],
    jumps: [],
    branch: [],
    group: []
};

var updateName = function (name) {
    formData.name = name;
};

var addComponent = function (val) {
    formData.components.push(val);
};

var updateComponent = function (key, val) {
    for (var i = 0; i < formData.components.length; i++) {
        if (formData.components[i].key == key) {
            formData.components[i].data = val;
        }
    }
};

var deleteComponent = function (key) {
    var index = function () {
        for (var i = 0; i < formData.components.length; i++) {
            if (formData.components[i].type == key) {
                return i;
                break;
            }
        }
    };
    formData.components.splice(index, 1);
}

var generateRef = function() {
    var ans = '';
    var arr = '0123456789abcdefghijklmnopqrstuvwxyz_';
    for (var i = 25; i > 0; i--) {
        ans +=
            arr[Math.floor(Math.random() * arr.length)];
    }
    return ans;
} 





