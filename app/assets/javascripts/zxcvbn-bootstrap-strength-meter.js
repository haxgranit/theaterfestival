//Requires zxcvbn.js and Bootstrap
(function ($) {

    $.fn.zxcvbnProgressBar = function (options) {

        //init settings
        var settings = $.extend({
            passwordInput: '#new_user #user_password',
            userInputs: [],
            progressBarText: '#password-strength-text',
            ratings: ["Very weak", "Weak", "OK", "Strong", "Very strong"],
            //all progress bar classes removed before adding score specific css class
            allProgressBarClasses: "progress-danger progress-warning progress-success progress-striped progress-animated",
            //bootstrap css classes (0-4 corresponds with zxcvbn score)
            progressBarClass0: "progress-danger progress-striped progress-animated",
            progressBarClass1: "progress-danger progress-striped progress-animated",
            progressBarClass2: "progress-danger progress-striped progress-animated",
            progressBarClass3: "progress-warning",
            progressBarClass4: "progress-success"
        }, options);

        return this.each(function () {
            settings.progressBar = this;
            //init progress bar display
            UpdateProgressBar();
            //Update progress bar on each keypress of password input
            $(settings.passwordInput).keyup(function (event) {
                UpdateProgressBar();
            });
        });

        function UpdateProgressBar() {
            var progressBar = settings.progressBar;
            var progressBarText = settings.progressBarText;
            var password = $(settings.passwordInput).val();
            if (password) {
                var result = zxcvbn(password, settings.userInputs);
                //result.score: 0, 1, 2, 3 or 4 - if crack time is less than 10**2, 10**4, 10**6, 10**8, Infinity.
                var score = result.score + 1;
                $(progressBar).val(score*20);

                if (score == 1 ) {
                    //weak
                    $(progressBar).removeClass(settings.allProgressBarClasses).addClass(settings.progressBarClass0);
                    $(progressBarText).html(settings.ratings[0]);
                }
                else if (score == 2) {
                    //normal
                    $(progressBar).removeClass(settings.allProgressBarClasses).addClass(settings.progressBarClass1);
                    $(progressBarText).html(settings.ratings[1]);
                }
                else if (score == 3) {
                    //medium
                    $(progressBar).removeClass(settings.allProgressBarClasses).addClass(settings.progressBarClass2);
                    $(progressBarText).html(settings.ratings[2]);
                }
                else if (score == 4) {
                    //strong
                    $(progressBar).removeClass(settings.allProgressBarClasses).addClass(settings.progressBarClass3);
                    $(progressBarText).html(settings.ratings[3]);
                }
                else if (score == 5) {
                    //very strong
                    $(progressBar).removeClass(settings.allProgressBarClasses).addClass(settings.progressBarClass4);
                    $(progressBarText).html(settings.ratings[4]);
                }
            }
            else {
                $(progressBar).val(0);
                $(progressBar).removeClass(settings.allProgressBarClasses).addClass(settings.progressBarClass0);
                $(progressBarText).html('');
            }
        }
    };
})(jQuery);
