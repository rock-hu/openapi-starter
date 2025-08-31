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
-- Name: payment_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_content (
    payment_id character varying(20) NOT NULL,
    payment_content_type_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_content OWNER TO ofbiz;

--
-- Name: payment_content pk_payment_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_content
    ADD CONSTRAINT pk_payment_content PRIMARY KEY (content_id, payment_id, payment_content_type_id, from_date);


--
-- Name: payment_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_cnt_cnt ON payment_content USING btree (content_id);


--
-- Name: payment_cnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_cnt_prod ON payment_content USING btree (payment_id);


--
-- Name: payment_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_cnt_type ON payment_content USING btree (payment_content_type_id);


--
-- Name: pmnt_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_cntnt_txcrts ON payment_content USING btree (created_tx_stamp);


--
-- Name: pmnt_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_cntnt_txstmp ON payment_content USING btree (last_updated_tx_stamp);


--
-- Name: payment_content payment_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_content
    ADD CONSTRAINT payment_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: payment_content payment_cnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_content
    ADD CONSTRAINT payment_cnt_prod FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- Name: payment_content payment_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_content
    ADD CONSTRAINT payment_cnt_type FOREIGN KEY (payment_content_type_id) REFERENCES payment_content_type(payment_content_type_id);


--
-- PostgreSQL database dump complete
--

