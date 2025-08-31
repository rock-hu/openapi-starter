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
-- Name: product_manufacturing_rule; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_manufacturing_rule (
    rule_id character varying(20) NOT NULL,
    product_id character varying(20),
    product_id_for character varying(20),
    product_id_in character varying(20),
    rule_seq_id character varying(20),
    from_date timestamp with time zone,
    product_id_in_subst character varying(20),
    product_feature character varying(20),
    rule_operator character varying(20),
    quantity double precision,
    description character varying(255),
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_manufacturing_rule OWNER TO ofbiz;

--
-- Name: product_manufacturing_rule pk_product_manufacturing_rule; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_manufacturing_rule
    ADD CONSTRAINT pk_product_manufacturing_rule PRIMARY KEY (rule_id);


--
-- Name: product_feat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_feat ON product_manufacturing_rule USING btree (product_feature);


--
-- Name: product_for; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_for ON product_manufacturing_rule USING btree (product_id_for);


--
-- Name: product_in; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_in ON product_manufacturing_rule USING btree (product_id_in);


--
-- Name: product_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_parent ON product_manufacturing_rule USING btree (product_id);


--
-- Name: product_subst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_subst ON product_manufacturing_rule USING btree (product_id_in_subst);


--
-- Name: prt_mnfctg_rl_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_mnfctg_rl_txcs ON product_manufacturing_rule USING btree (created_tx_stamp);


--
-- Name: prt_mnfctg_rl_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_mnfctg_rl_txsp ON product_manufacturing_rule USING btree (last_updated_tx_stamp);


--
-- Name: product_manufacturing_rule product_feat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_manufacturing_rule
    ADD CONSTRAINT product_feat FOREIGN KEY (product_feature) REFERENCES product_feature(product_feature_id);


--
-- Name: product_manufacturing_rule product_for; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_manufacturing_rule
    ADD CONSTRAINT product_for FOREIGN KEY (product_id_for) REFERENCES product(product_id);


--
-- Name: product_manufacturing_rule product_in; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_manufacturing_rule
    ADD CONSTRAINT product_in FOREIGN KEY (product_id_in) REFERENCES product(product_id);


--
-- Name: product_manufacturing_rule product_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_manufacturing_rule
    ADD CONSTRAINT product_parent FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_manufacturing_rule product_subst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_manufacturing_rule
    ADD CONSTRAINT product_subst FOREIGN KEY (product_id_in_subst) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

