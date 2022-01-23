#include <string>

extern "C" {
    const char *_ZN7android8hardware5radio4V1_08toStringENS2_13PersoSubstateE(int SubaddressType) {
        std::string buf(""); buf.append(std::to_string(SubaddressType)); return buf.c_str();
    }
}
