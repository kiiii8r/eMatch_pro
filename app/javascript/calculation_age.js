function calculation_age() {
  const birthYear = document.getElementById("user_birth_day_1i");
  const birthMonth = document.getElementById("user_birth_day_2i");
  const birthDay = document.getElementById("user_birth_day_3i");
  const resultAge = document.getElementById("result-age");
  const resultSet = document.getElementById("result-set");

  window.addEventListener("mouseover", () => {
    calculation();
  });

  function calculation(){
    if (birthYear.value && birthMonth.value && birthDay.value){
      const birthday = birthYear.value + (0 + birthMonth.value).slice(-2) + (0 + birthDay.value).slice(-2);
      const today = new Date();
      const date = ( today.getFullYear() * 10000 ) + (( today.getMonth() + 1 ) * 100 ) + today.getDate() ;
      const age = ( Math.floor(( date - birthday ) / 10000 ));
      resultAge.textContent = age;
      resultSet.textContent = age;
    } else {
      resultAge.textContent = '';
      resultSet.textContent = '';
    };
  };
};

window.addEventListener("load", calculation_age);
