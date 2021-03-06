#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'human_eval_types'

module HumanEvalTaskManager
  class Client
    include ::Thrift::Client

    def submitTask(params)
      send_submitTask(params)
      return recv_submitTask()
    end

    def send_submitTask(params)
      send_message('submitTask', SubmitTask_args, :params => params)
    end

    def recv_submitTask()
      result = receive_message(SubmitTask_result)
      return result.success unless result.success.nil?
      raise result.hec unless result.hec.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'submitTask failed: unknown result')
    end

    def fetchAnnotations(params)
      send_fetchAnnotations(params)
      return recv_fetchAnnotations()
    end

    def send_fetchAnnotations(params)
      send_message('fetchAnnotations', FetchAnnotations_args, :params => params)
    end

    def recv_fetchAnnotations()
      result = receive_message(FetchAnnotations_result)
      return result.success unless result.success.nil?
      raise result.hec unless result.hec.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'fetchAnnotations failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_submitTask(seqid, iprot, oprot)
      args = read_args(iprot, SubmitTask_args)
      result = SubmitTask_result.new()
      begin
        result.success = @handler.submitTask(args.params)
      rescue HumanEvalException => hec
        result.hec = hec
      end
      write_result(result, oprot, 'submitTask', seqid)
    end

    def process_fetchAnnotations(seqid, iprot, oprot)
      args = read_args(iprot, FetchAnnotations_args)
      result = FetchAnnotations_result.new()
      begin
        result.success = @handler.fetchAnnotations(args.params)
      rescue HumanEvalException => hec
        result.hec = hec
      end
      write_result(result, oprot, 'fetchAnnotations', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class SubmitTask_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    PARAMS = 1

    FIELDS = {
      PARAMS => {:type => ::Thrift::Types::STRUCT, :name => 'params', :class => HumanEvalSubmitTaskParams}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SubmitTask_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    HEC = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => HumanEvalSubmitTaskResponse},
      HEC => {:type => ::Thrift::Types::STRUCT, :name => 'hec', :class => HumanEvalException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class FetchAnnotations_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    PARAMS = 1

    FIELDS = {
      PARAMS => {:type => ::Thrift::Types::STRUCT, :name => 'params', :class => HumanEvalFetchAnnotationParams}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class FetchAnnotations_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    HEC = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => HumanEvalFetchAnnotationResponse},
      HEC => {:type => ::Thrift::Types::STRUCT, :name => 'hec', :class => HumanEvalException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

