#include <cmath>
#include <iostream>
#include <string>

int
main(int cout, char* argv[])
{

  std::string first_line;
  std::getline(std::cin, first_line);
  double given;
  try {
    given = std::stod(first_line);
  } catch (...) {
    std::cerr << "error applying std::stod" << std::endl;
    return EXIT_FAILURE;
  }
  auto rounded = std::round(given);
  std::cout << rounded;
  if (cout == 1 || std::string(argv[1]) != "-n") 
    std::cout << '\n';
  std::cout << std::flush;

  return EXIT_SUCCESS;
}
