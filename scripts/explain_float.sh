#!/usr/bin/bash
set -euo pipefail

if [ -t 1 ]; then
  color=true
else
  color=false
fi

_sc() { if [ ${color} == true ]; then tput setaf  51; fi }
_ec() { if [ ${color} == true ]; then tput setaf 155; fi }
_mc() { if [ ${color} == true ]; then tput setaf 209; fi }
_bc() { if [ ${color} == true ]; then tput setaf 226; fi }
_ic() { if [ ${color} == true ]; then tput setaf 202; fi }
_nc() { if [ ${color} == true ]; then tput sgr0     ; fi }

zero_exponent() { for (( i=0; i<$exponent_bits; i++ )); do echo -n '0'; done }
ones_exponent() { for (( i=0; i<$exponent_bits; i++ )); do echo -n '1'; done }
zero_mantissa() { for (( i=0; i<$mantissa_bits; i++ )); do echo -n '0'; done }

input=${1:-00000000011111111111111111111111}
if [ "${input}" == "-h" ] ; then
  echo "explain_float.sh"
  echo "(a little bash script that explains IEEE floats to you)"
  echo ""
  echo "USAGE:"
  echo "| > explain_float.sh <float number bits, 8, 16, 32, .. bits>"
  echo "| "
  echo "|   e.g."
  echo "|   > explain_float.sh 0101010101010101"
  echo "|   will tell you about the float representation of 85.3125"
  echo ""
  echo "enjoy 🙂"
  echo "(be aware that its not 100% exact; I can't remember right now what it was,"
  echo " but between the different ways to convert and mathematically manipulate numbers"
  echo " I'm pretty sure there was some exactness issues however many places after the"
  echo " decimal point)"
  exit 0
fi

input_len=`echo -n "$input" | wc -c`

if [ $input_len -eq 16 ]; then
  exponent_bits=5
  mantissa_bits=10
elif [ $input_len -eq 32 ]; then
  exponent_bits=8
  mantissa_bits=23
elif [ $input_len -eq 64 ]; then
  exponent_bits=11
  mantissa_bits=52
else
  echo "ERROR, input of length ${input_len} not supported"
  exit -1
fi

sign_b="$(echo ${input} | cut -c 1)"
exponent_b="$(echo ${input} | cut -c 2-$((1+${exponent_bits})))"
mantissa_b="$(echo ${input} | cut -c $((2+${exponent_bits}))-)"

bias="($((1-(2**(${exponent_bits}-1)))))"

# TODO: this comes up with "" for an all 1s mantissa, because awk rounds up
#       bc seems to do it right, not sure what the upside of awk was
mantissa=$(awk "BEGIN { print $(( 2#${mantissa_b} ))*(2^-${mantissa_bits}) }" | cut -c 2-)
if [[ -z "${mantissa}" ]]; then mantissa=".0"; fi
exponent=$(( 2#${exponent_b} ))
if [ ${exponent_b} == `zero_exponent` -a ${mantissa_b} == `zero_mantissa` ]; then
  implied_mantissa="$(_mc)0${mantissa}$(_nc)"
  implied_mantissa_value="0${mantissa}"
else
  implied_mantissa="$(_ic)1$(_mc)${mantissa}$(_nc)"
  implied_mantissa_value="1${mantissa}"
fi


print_input() {
  echo "$(_sc)${sign_b}$(_ec)${exponent_b}$(_mc)${mantissa_b}$(_nc)"
}

print_brace() {
  brace_width=${1}
  left_width=$(( (${brace_width}-3)/2 ))
  right_width=$(( (${brace_width}-3)-${left_width} ))
  echo -n '`'
  for (( i=1; i<=${left_width} ; i++)); do echo -n '-'; done
  echo -n '+'
  for (( i=1; i<=${right_width} ; i++)); do echo -n '-'; done
  echo -n '´'
}

print_halfway_spacer() {
  width=${1}
  left_width=$(( (${width}-3)/2 ))
  for (( i=0; i<=${left_width} ; i++)); do echo -n ' '; done
}

print_centerline() {
  width=${1}
  left_width=$(( (${width}-3)/2 ))
  right_width=$(( (${width}-2-1)-${left_width} ))
  for (( i=0; i<=${left_width} ; i++)); do echo -n ' '; done
  echo -n '|'
  for (( i=0; i<=${right_width} ; i++)); do echo -n ' '; done
}

segment_input() {
  _sc; echo -n '|'; _ec; print_brace ${exponent_bits};      _mc; print_brace ${mantissa_bits};                                                           _nc; echo
  _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; _mc; print_centerline ${mantissa_bits};                                                      _nc; echo
  if [ ${exponent_b} == `zero_exponent` ]; then
    _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; _mc; print_halfway_spacer ${mantissa_bits}; echo -n 'Mantissa';                              _nc; echo
    _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; print_halfway_spacer $((${mantissa_bits}-1));                    _mc; echo -n "${mantissa}"; _nc; echo
    _sc; echo -n '|'; _ec; print_halfway_spacer ${exponent_bits}; echo -n 'Exponent';                                                                      _nc; echo
    _sc; echo -n '|'; _ec; print_halfway_spacer ${exponent_bits}; echo -n "(special zero exponent)"; _nc;                                                  _nc; echo
  elif [ ${exponent_b} == `ones_exponent` ]; then
    _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; _mc; print_halfway_spacer ${mantissa_bits}; echo -n 'Mantissa';                              _nc; echo
    if [ $((2#${mantissa_b})) -ne 0 ]; then
      _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; print_halfway_spacer $((${mantissa_bits})); _mc; echo -n "(nonzero mantissa indicates NaN)"; _nc; echo
    else 
      _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; print_halfway_spacer $((${mantissa_bits})); _mc; echo -n "(zero mantissa indicates infinity)"; _nc; echo
    fi
    _sc; echo -n '|'; _ec; print_halfway_spacer ${exponent_bits}; echo -n 'Exponent';                                                                      _nc; echo
    _sc; echo -n '|'; _ec; print_halfway_spacer ${exponent_bits}; echo -n "(special ones exponent indicates either inf. or NaN)"; _nc;                                                  _nc; echo
  else
    _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; _mc; print_halfway_spacer ${mantissa_bits}; echo -n 'Mantissa';                              _nc; echo
    _sc; echo -n '|'; _ec; print_centerline ${exponent_bits}; print_halfway_spacer $((${mantissa_bits}-1));  _ic; echo -n "1"; _mc; echo -n "${mantissa}"; _nc; echo
    _sc; echo -n '|'; _ec; print_halfway_spacer ${exponent_bits}; echo -n 'Exponent';                                                                      _nc; echo
    _sc; echo -n '|'; _ec; print_halfway_spacer ${exponent_bits}; echo -n "${exponent}"; _nc; echo -n "+"; _bc; echo -n "${bias}"; _nc; _nc;               _nc; echo
  fi
  _sc; echo -n 'Sign';                                                                                                                                   _nc; echo
  _sc; echo -n "${sign_b}";                                                                                                                              _nc; echo
}

explain_special() {
  if [ ${exponent_b} == `zero_exponent` ]; then
    _nc; echo
    echo "Here we are dealing with the $(_ec)zero exponent$(_nc) ($(_ec)${exponent_b}$(_nc))."
    echo "This special value indicates either a float value of 0 or that we are dealing"
    echo "with a denormal number, depending on the value of the $(_mc)mantissa$(_nc)."
  elif [ ${exponent_b} == `ones_exponent` ]; then
    _nc; echo
    echo "Here we are dealing with the $(_ec)exponent which is all ones$(_nc) ($(_ec)${exponent_b}$(_nc))."
    echo "It indicates that we are dealing with a special number, either infinity (inf)"
    echo "or not a number at all (NaN), depending on the $(_mc)mantissa$(_nc)'s value."
  fi
}

explain_mantissa() {
  _nc; echo
  if [ ${exponent_b} == `ones_exponent` ]; then
    echo "Since our $(_ec)exponent$(_nc) indicates a special number, our $(_mc)mantissa$(_nc) encodes which it"
    echo "will be:"
    echo "  $(_mc)   a zero value$(_nc) -> infinity     (inf)"
    echo "  $(_mc)any other value$(_nc) -> not a number (NaN)"
    echo "In our case, since the $(_mc)mantissa$(_nc) is $(_mc)$([[ ${mantissa_b} == `zero_mantissa` ]] && echo zero || echo non-zero)$(_nc) our float represents"
    echo "$([[ ${mantissa_b} == `zero_mantissa` ]] && echo infinity || echo not a number)."
  else
    echo "The $(_mc)mantissa$(_nc), which is sometimes also called a $(_mc)significand$(_nc), gives the"
    echo "$(_mc)significant bits$(_nc) of our number. That is to say, it encodes the value but that"
    echo "value might still have to be shifted (according to the $(_ec)exponent$(_nc)) and be"
    echo "considered as negative (according to the $(_sc)sign$(_nc)) to get the correct result."
    echo "Our $(_mc)mantissa$(_nc) in bits is"
    echo "  $(_mc)${mantissa_b}$(_nc)."
    if [ ${exponent_b} == `zero_exponent` -a ${mantissa_b} == `zero_mantissa` ]; then
      echo "Since our $(_ec)exponent$(_nc) is $(_ec)zero$(_nc) this $(_mc)zero mantissa$(_nc) indicates that we have a final"
      echo "float value of zero as well."
    else
      echo "The first bit encodes 2^(-1), the second 2^(-2), and so on, analogous to how"
      echo "integers are represented in binary; thus in decimal our $(_mc)mantissa$(_nc) is"
      echo "  $(_mc)${mantissa}$(_nc)."
    fi
    if [ ${exponent_b} != `zero_exponent` ]; then
      echo "However, there is an $(_ic)implicit 1-bit$(_nc) prefixed to the $(_mc)mantissa$(_nc) and the actual"
      echo "value is thus"
      echo "  $(_ic)1$(_nc)$(_mc)${mantissa}$(_nc)."
    fi
  fi
}

explain_exponent() {
  if [ ${exponent_b} != `zero_exponent` -a ${exponent_b} != `ones_exponent` ]; then
    _nc; echo
    echo "The $(_ec)exponent$(_nc) tells us, with what power of 2 we should multiply our"
    echo "$(_mc)mantissa$(_nc). In the binary representation this can also be thought of as how far"
    echo "the floating point in the $(_mc)mantissa$(_nc) should be shifted. The $(_ec)exponent$(_nc) represented"
    echo "in binary is $(_ec)${exponent_b}$(_nc) which in decimal is $(_ec)${exponent}$(_nc)."
    echo "The $(_ec)exponent$(_nc) has a $(_bc)bias$(_nc) of $(_bc)${bias}$(_nc) which is why we need to multiply our"
    echo "$(_mc)mantissa$(_nc) with 2^($(_ec)${exponent}$(_nc)+$(_bc)${bias}$(_nc))."
  fi
}

explain_sign() {
  _nc; echo
  echo "Since the $(_sc)sign$(_nc) is $(_sc)${sign_b}$(_nc) we have a $(_sc)$([[ "${sign_b}" == "0" ]] && echo "positive" || echo "negative")$(_nc) number."
}

explain_final() {
  _nc; echo
  if [ ${exponent_b} == `ones_exponent` ]; then
    echo "As detailed above, we're dealing with a special number:"
    echo "  $(_sc)$([[ "${sign_b}" == "0" ]] || echo "-")$(_nc) $([[ ${mantissa_b} == `zero_mantissa` ]] && echo inf || echo NaN)"
  elif [ ${exponent_b} == `zero_exponent` ]; then
    if [ ${mantissa_b} == `zero_mantissa` ]; then
      echo "As detailed above, here we have a float value of 0."
    else
      echo "Our final value can be calculated as follows:"
      echo "  (-1)^($(_sc)sign$(_nc)) * 2^($(_ec)exponent$(_nc)+$(_bc)bias$(_nc)) * ($(_mc)mantissa$(_nc) with $(_ic)impl. 1-bit prefix$(_nc))"
      echo "= (-1)^($(_sc)${sign_b}$(_nc)) * 2^($(_ec)${exponent}$(_nc)+$(_bc)${bias}$(_nc)) * ${implied_mantissa}"
      echo "= $(( (-1)**${sign_b} )) * $(awk "BEGIN { print 2^(${exponent}+${bias}) }") * ${implied_mantissa}"
      echo "= $(awk "BEGIN { print $(( (-1)**${sign_b} )) * 2^(${exponent}+${bias})  * ${implied_mantissa_value} }")"
    fi
  else
    echo "Our final value can be calculated as follows:"
    echo "  (-1)^($(_sc)sign$(_nc)) * 2^($(_ec)exponent$(_nc)+$(_bc)bias$(_nc)) * ($(_mc)mantissa$(_nc) with $(_ic)impl. 1-bit prefix$(_nc))"
    echo "= (-1)^($(_sc)${sign_b}$(_nc)) * 2^($(_ec)${exponent}$(_nc)+$(_bc)${bias}$(_nc)) * ${implied_mantissa}"
    echo "= $(( (-1)**${sign_b} )) * $(awk "BEGIN { print 2^(${exponent}+${bias}) }") * ${implied_mantissa}"
    echo "= $(awk "BEGIN { print $(( (-1)**${sign_b} )) * 2^(${exponent}+${bias})  * ${implied_mantissa_value} }")"
  fi
}

print_input
segment_input
explain_special
explain_mantissa
explain_exponent
explain_sign
explain_final

# END
_nc
