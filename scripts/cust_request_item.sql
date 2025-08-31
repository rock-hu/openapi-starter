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
-- Name: cust_request_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_item (
    cust_request_id character varying(20) NOT NULL,
    cust_request_item_seq_id character varying(20) NOT NULL,
    cust_request_resolution_id character varying(20),
    status_id character varying(20),
    priority numeric(20,0),
    sequence_num numeric(20,0),
    required_by_date timestamp with time zone,
    product_id character varying(20),
    quantity numeric(18,6),
    selected_amount numeric(18,6),
    maximum_amount numeric(18,2),
    reserv_start timestamp with time zone,
    reserv_length numeric(18,6),
    reserv_persons numeric(18,6),
    config_id character varying(20),
    description character varying(255),
    story text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_item OWNER TO ofbiz;

--
-- Name: cust_request_item pk_cust_request_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item
    ADD CONSTRAINT pk_cust_request_item PRIMARY KEY (cust_request_id, cust_request_item_seq_id);


--
-- Name: cst_rqt_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_itm_txcrts ON cust_request_item USING btree (created_tx_stamp);


--
-- Name: cst_rqt_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_itm_txstmp ON cust_request_item USING btree (last_updated_tx_stamp);


--
-- Name: cust_reqitm_creq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_reqitm_creq ON cust_request_item USING btree (cust_request_id);


--
-- Name: cust_reqitm_prd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_reqitm_prd ON cust_request_item USING btree (product_id);


--
-- Name: cust_reqitm_res; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_reqitm_res ON cust_request_item USING btree (cust_request_resolution_id);


--
-- Name: cust_reqitm_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_reqitm_stts ON cust_request_item USING btree (status_id);


--
-- Name: cust_request_item cust_reqitm_creq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item
    ADD CONSTRAINT cust_reqitm_creq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: cust_request_item cust_reqitm_prd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item
    ADD CONSTRAINT cust_reqitm_prd FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: cust_request_item cust_reqitm_res; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item
    ADD CONSTRAINT cust_reqitm_res FOREIGN KEY (cust_request_resolution_id) REFERENCES cust_request_resolution(cust_request_resolution_id);


--
-- Name: cust_request_item cust_reqitm_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item
    ADD CONSTRAINT cust_reqitm_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

