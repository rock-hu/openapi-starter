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
-- Name: cust_request_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_content (
    cust_request_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_content OWNER TO ofbiz;

--
-- Name: cust_request_content pk_cust_request_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_content
    ADD CONSTRAINT pk_cust_request_content PRIMARY KEY (cust_request_id, content_id, from_date);


--
-- Name: cst_rqt_cntt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_cntt_txcrs ON cust_request_content USING btree (created_tx_stamp);


--
-- Name: cst_rqt_cntt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_cntt_txstp ON cust_request_content USING btree (last_updated_tx_stamp);


--
-- Name: custreq_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX custreq_cnt_cnt ON cust_request_content USING btree (content_id);


--
-- Name: custreq_cnt_custrq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX custreq_cnt_custrq ON cust_request_content USING btree (cust_request_id);


--
-- Name: cust_request_content custreq_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_content
    ADD CONSTRAINT custreq_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: cust_request_content custreq_cnt_custrq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_content
    ADD CONSTRAINT custreq_cnt_custrq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- PostgreSQL database dump complete
--

