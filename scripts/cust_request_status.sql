--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cust_request_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_status (
    cust_request_status_id character varying(20) NOT NULL,
    status_id character varying(20),
    cust_request_id character varying(20),
    cust_request_item_seq_id character varying(20),
    status_date timestamp with time zone,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_status OWNER TO ofbiz;

--
-- Name: cust_request_status pk_cust_request_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_status
    ADD CONSTRAINT pk_cust_request_status PRIMARY KEY (cust_request_status_id);


--
-- Name: cst_rqt_sts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_sts_txcrts ON cust_request_status USING btree (created_tx_stamp);


--
-- Name: cst_rqt_sts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_sts_txstmp ON cust_request_status USING btree (last_updated_tx_stamp);


--
-- Name: cust_req_strq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_strq ON cust_request_status USING btree (cust_request_id);


--
-- Name: cust_reqst_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_reqst_stts ON cust_request_status USING btree (status_id);


--
-- Name: cust_rqstts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_rqstts_usrlgn ON cust_request_status USING btree (change_by_user_login_id);


--
-- Name: cust_request_status cust_req_strq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_status
    ADD CONSTRAINT cust_req_strq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: cust_request_status cust_reqst_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_status
    ADD CONSTRAINT cust_reqst_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: cust_request_status cust_rqstts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_status
    ADD CONSTRAINT cust_rqstts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

