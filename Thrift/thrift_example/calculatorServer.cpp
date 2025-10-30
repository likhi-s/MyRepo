#include "gen-cpp/Calculator.h"
#include <thrift/server/TSimpleServer.h>
#include <thrift/transport/TServerSocket.h>
#include <thrift/transport/TBufferTransports.h>
#include <thrift/protocol/TBinaryProtocol.h>
#include <iostream>
#include <memory>

using namespace ::apache::thrift;
using namespace ::apache::thrift::protocol;
using namespace ::apache::thrift::transport;
using namespace ::apache::thrift::server;

using namespace tutorial;

class CalculatorHandler : public CalculatorIf
{
    // CalculatorIf interface
public:
    int32_t add(const int32_t num1, const int32_t num2)
    {
        return num1 + num2;
    }
    int32_t substract(const int32_t num1, const int32_t num2)
    {
        return num1 - num2;

    }
    void myFunction(const int32_t num1, const int32_t num2)
    {
        std::cout<<"My function"<<num1/num2 <<std::endl;
    }
    double multiply(const double num1, const double num2)
    {
        return num1 * num2;
    }
};

int main()
{
    auto handler = std::make_shared<CalculatorHandler>();
    auto processor = std::make_shared<CalculatorProcessor>(handler);
    auto serverTransport = std::make_shared<TServerSocket>(9090);
    auto transportFactory = std::make_shared<TBufferedTransportFactory>();
    auto protocolFactory = std::make_shared<TBinaryProtocolFactory>();

    TSimpleServer server(processor, serverTransport, transportFactory, protocolFactory);
    std::cout << "Starting server on port 9090..." << std::endl;
    server.serve();
    return 0;
}




