/* Copyright (c) 2015, 2025, Oracle and/or its affiliates.

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License, version 2.0,
 as published by the Free Software Foundation.

 This program is designed to work with certain software (including
 but not limited to OpenSSL) that is licensed under separate terms,
 as designated in a particular file or component or in included license
 documentation.  The authors of MySQL hereby grant you an additional
 permission to link the program and your derivative works with the
 separately licensed software that they have either included with
 the program or referenced in the documentation.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License, version 2.0, for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA */


#ifndef _MYSQLX_ERROR_H_
#define _MYSQLX_ERROR_H_

#define ER_X_BAD_MESSAGE 5000
#define ER_X_CAPABILITIES_PREPARE_FAILED 5001
#define ER_X_CAPABILITY_NOT_FOUND 5002
#define ER_X_INVALID_PROTOCOL_DATA 5003
#define ER_X_BAD_CONNECTION_SESSION_ATTRIBUTE_VALUE_LENGTH 5004
#define ER_X_BAD_CONNECTION_SESSION_ATTRIBUTE_KEY_LENGTH 5005
#define ER_X_BAD_CONNECTION_SESSION_ATTRIBUTE_EMPTY_KEY 5006
#define ER_X_BAD_CONNECTION_SESSION_ATTRIBUTE_LENGTH 5007
#define ER_X_BAD_CONNECTION_SESSION_ATTRIBUTE_TYPE 5008
#define ER_X_CAPABILITY_SET_NOT_ALLOWED 5009
#define ER_X_SERVICE_ERROR 5010
#define ER_X_SESSION 5011
#define ER_X_INVALID_ARGUMENT 5012
#define ER_X_MISSING_ARGUMENT 5013
#define ER_X_BAD_INSERT_DATA 5014
#define ER_X_CMD_NUM_ARGUMENTS 5015
#define ER_X_CMD_ARGUMENT_TYPE 5016
#define ER_X_CMD_ARGUMENT_VALUE 5017
#define ER_X_BAD_UPSERT_DATA 5018
#define ER_X_DUPLICATED_CAPABILITIES 5019
#define ER_X_CMD_ARGUMENT_OBJECT_EMPTY 5020
#define ER_X_CMD_INVALID_ARGUMENT 5021
#define ER_X_BAD_UPDATE_DATA 5050
#define ER_X_BAD_TYPE_OF_UPDATE 5051
#define ER_X_BAD_COLUMN_TO_UPDATE 5052
#define ER_X_BAD_MEMBER_TO_UPDATE 5053
#define ER_X_BAD_STATEMENT_ID 5110
#define ER_X_BAD_CURSOR_ID 5111
#define ER_X_BAD_SCHEMA 5112
#define ER_X_BAD_TABLE 5113
#define ER_X_BAD_PROJECTION 5114
#define ER_X_DOC_ID_MISSING 5115
#define ER_X_DUPLICATE_ENTRY 5116
#define ER_X_DOC_REQUIRED_FIELD_MISSING 5117
#define ER_X_PROJ_BAD_KEY_NAME 5120
#define ER_X_BAD_DOC_PATH 5121
#define ER_X_CURSOR_EXISTS 5122
#define ER_X_CURSOR_REACHED_EOF 5123
#define ER_X_PREPARED_STATMENT_CAN_HAVE_ONE_CURSOR 5131
#define ER_X_PREPARED_EXECUTE_ARGUMENT_NOT_SUPPORTED 5133
#define ER_X_PREPARED_EXECUTE_ARGUMENT_CONSISTENCY 5134
#define ER_X_EXPR_BAD_OPERATOR 5150
#define ER_X_EXPR_BAD_NUM_ARGS 5151
#define ER_X_EXPR_MISSING_ARG 5152
#define ER_X_EXPR_BAD_TYPE_VALUE 5153
#define ER_X_EXPR_BAD_VALUE 5154
#define ER_X_INVALID_COLLECTION 5156
#define ER_X_INVALID_ADMIN_COMMAND 5157
#define ER_X_EXPECT_NOT_OPEN 5158
#define ER_X_EXPECT_NO_ERROR_FAILED 5159
#define ER_X_EXPECT_BAD_CONDITION 5160
#define ER_X_EXPECT_BAD_CONDITION_VALUE 5161
#define ER_X_INVALID_NAMESPACE 5162
#define ER_X_BAD_NOTICE 5163
#define ER_X_CANNOT_DISABLE_NOTICE 5164
#define ER_X_BAD_CONFIGURATION 5165
#define ER_X_MYSQLX_ACCOUNT_MISSING_PERMISSIONS 5167
#define ER_X_EXPECT_FIELD_EXISTS_FAILED 5168
#define ER_X_BAD_LOCKING 5169
#define ER_X_FRAME_COMPRESSION_DISABLED 5170
#define ER_X_DECOMPRESSION_FAILED 5171
#define ER_X_BAD_COMPRESSED_FRAME 5174
#define ER_X_CAPABILITY_COMPRESSION_INVALID_ALGORITHM 5175
#define ER_X_CAPABILITY_COMPRESSION_INVALID_SERVER_STYLE 5176
#define ER_X_CAPABILITY_COMPRESSION_INVALID_CLIENT_STYLE 5177
#define ER_X_CAPABILITY_COMPRESSION_INVALID_OPTION 5178
#define ER_X_CAPABILITY_COMPRESSION_MISSING_REQUIRED_FIELDS 5179
#define ER_X_DOCUMENT_DOESNT_MATCH_EXPECTED_SCHEMA 5180
#define ER_X_COLLECTION_OPTION_DOESNT_EXISTS 5181
#define ER_X_INVALID_VALIDATION_SCHEMA 5182


#endif // _MYSQLX_ERROR_H_
